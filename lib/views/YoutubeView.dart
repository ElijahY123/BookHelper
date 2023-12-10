import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:collection/collection.dart'; // Add this for groupBy extension

class VideoInfo {
  final String topic;
  final String videoName;
  final String videoUrl;

  VideoInfo({
    required this.topic,
    required this.videoName,
    required this.videoUrl,
  });
}

class YoutubeView extends StatelessWidget {
  final List<VideoInfo> videoInfos;
  final void Function(List<VideoInfo> videoInfos) onWatchYoutube;

  YoutubeView({
    required this.videoInfos,
    required this.onWatchYoutube,
  });

  @override
  Widget build(BuildContext context) {
    // Group videos by topic
    var groupedVideos = groupBy(videoInfos, (VideoInfo video) => video.topic);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Video Guides',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: Container(
        color: Colors.black12,
        child: ListView(
          children: groupedVideos.entries.map((entry) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Topic Banner
                Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.blueGrey, // Customize banner color
                  child: Text(
                    entry.key,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                // Video List
                ...entry.value.map((videoInfo) => Card(
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(
                      '${videoInfo.videoName}',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    onTap: () => _playYoutubeVideo(context, videoInfo.videoUrl),
                  ),
                )),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  void _playYoutubeVideo(BuildContext context, String videoUrl) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => YoutubePlayerScreen(videoUrl: videoUrl),
      ),
    );
  }
}

class YoutubePlayerScreen extends StatefulWidget {
  final String videoUrl;

  YoutubePlayerScreen({required this.videoUrl});

  @override
  _YoutubePlayerScreenState createState() => _YoutubePlayerScreenState();
}

class _YoutubePlayerScreenState extends State<YoutubePlayerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl) ?? '',
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );

    // Add listener for fullscreen changes
    _controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _controller.value.isFullScreen ? null : AppBar(
        title: Text('Video Player'),
      ),
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
