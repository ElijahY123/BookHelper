import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView( // Enable scrolling
        child: Column(
          children: [
            Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: 100,
                decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.lightBlueAccent, Colors.indigo]
                    )
                ),
                child: Center(
                  child: Text(
                    "Video Guides",
                    style: GoogleFonts.aBeeZee(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                )
            ),
            const SizedBox(height: 42),
            _buildElevatedButton(
                context, 'Study Habits', 'assets/Images/studyingTips.jpg'),
            const SizedBox(height: 42),
            _buildElevatedButton(
                context, 'Useful Info', 'assets/Images/usefulInfo.jpg'),
            const SizedBox(height: 42),
            _buildElevatedButton(
                context, 'Books to Read', 'assets/Images/booksToRead.jpg'),
            const SizedBox(height: 15),
            const Text(
              "** Tap on a Box to View Videos **",
              style: TextStyle(fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildElevatedButton(BuildContext context, String topic,
      String imagePath) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
                VideoPage(videoInfos: videoInfos,
                    onWatchYoutube: onWatchYoutube,
                    whichButton: topic))
        );
      },
      child: Container(
        height: 150,
        width: screenWidth * 0.8, // Adjusted width to 80% of screen width
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Colors.green,
          image: DecorationImage(
              image: AssetImage(imagePath), fit: BoxFit.fill),
        ),
        child: Container(
          margin: const EdgeInsets.only(left: 10, top: 110, right: 10),
          // Adjusted right margin
          child: Text(
            topic,
            style: GoogleFonts.aBeeZee(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
  class VideoPage extends StatelessWidget {

  final List<VideoInfo> videoInfos;
  final void Function(List<VideoInfo> videoInfos) onWatchYoutube;
  final String whichButton;

  const VideoPage({
    super.key,
    required this.videoInfos,
    required this.onWatchYoutube,
    required this.whichButton
  });

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                    height: 120,
                    width: 400,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.red,
                          Colors.deepOrangeAccent
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight
                      )
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 30,
                                )
                            ),
                            const SizedBox(
                              width: 1,
                            )
                          ],
                        ),
                        Center(
                          child: Text(
                            'Related Videos',
                            style: GoogleFonts.aBeeZee(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        )
                      ],
                    )
                ),
                Container(
                  height: 600,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: videoInfos.length,
                    itemBuilder: (context, index)
                    {
                      VideoInfo videoInfo = videoInfos[index];
                      if (videoInfo.topic == whichButton) {
                        return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent
                            ),
                            onPressed: () => _playYoutubeVideo(context, videoInfo.videoUrl),
                            child: Column(
                              children: [
                                Container(
                                  height: 100,
                                  width: 400,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  child: Center(
                                    child: Text(
                                      videoInfo.videoName,
                                      style: GoogleFonts.aBeeZee(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),

                                ),
                                const SizedBox(
                                  height: 10,
                                )
                              ],
                            )
                        );
                      }
                      else {
                        return const SizedBox(
                          height: 0.001,
                          width: 0.001,
                        );
                      }
                      return null;
                    },
                  ),
                ),
              ],
            )
          ],
        )
      );
  }
}

  void _playYoutubeVideo(BuildContext context, String videoUrl) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => YoutubePlayerScreen(videoUrl: videoUrl),
      ),
    );
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
