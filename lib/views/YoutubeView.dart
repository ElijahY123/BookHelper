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
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        colors: [
                          Colors.lightBlueAccent,
                          Colors.indigo
                        ]
                      )
                      /*image: DecorationImage(
                          image: AssetImage(
                              "assets/Images/videoGuidesBanner.jpg"
                                  //Citation: Barysevich, I. (2022). Remote Work social media banner. Freelancer Working Distant on Pc from Home linkedin cover, Self-employed Occupation header. Cartoon Flat Vector Illustration. Retrieved from https://www.vecteezy.com/vector-art/12720076-remote-work-social-media-banner-freelancer-working-distant-on-pc-from-home-linkedin-cover-self-employed-occupation-header-cartoon-flat-vector-illustration
                          ),
                          fit: BoxFit.fill
                      )*/
                  ),
                  child: Center(
                    child: Text(
                      "Video Guides",
                      style: GoogleFonts.aBeeZee(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                      ), // GoogleFonts
                    ),
                  )
              ),
              const SizedBox(
                height: 42,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StudyingTips(videoInfos: videoInfos, onWatchYoutube: onWatchYoutube, whichButton: 'Study Habits'))
                  );
                },
                child: Container(
                  height: 150,
                  width: 400,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.green,
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/Images/studyingTips.jpg",
                        ),
                        fit: BoxFit.fill
                    ),
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(
                          left: 10, top: 110, right: 160),
                      child: Text(
                        "Study Habits",
                        //Citation: Hu, A. (2023). Artwork: How I Wish Studying Felt Like. Retrieved from https://www.girlspring.com/how-i-wish-studying-felt-like/
                        style: GoogleFonts.aBeeZee(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 42,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StudyingTips(videoInfos: videoInfos, onWatchYoutube: onWatchYoutube, whichButton: 'Useful Info'))
                  );
                },
                child: Container(
                  height: 150,
                  width: 400,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.green,
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/Images/usefulInfo.jpg"
                                  //Citation: HD Computer Science Backgrounds Images,Cool Pictures Free Download. (n.d.). Retrieved from https://lovepik.com/images/backgrounds-computer-science.html
                          ),
                          fit: BoxFit.fill
                      )
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 10, top: 110, right: 180),
                    child: Text(
                      "Useful Info",
                      style: GoogleFonts.aBeeZee(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 42,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StudyingTips(videoInfos: videoInfos, onWatchYoutube: onWatchYoutube, whichButton: 'Books to Read'))
                  );
                },
                child: Container(
                  height: 150,
                  width: 400,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.green,
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/Images/booksToRead.jpg"
                                //Citation: Library, bookstore banner design. Education aesthetic, elegant study background. Pile of books with paper, glasses and pencil flat cartoon illustration. Stock Vector. (n.d.). Retrieved from https://stock.adobe.com/images/library-bookstore-banner-design-education-aesthetic-elegant-study-background-pile-of-books-with-paper-glasses-and-pencil-flat-cartoon-illustration/422506759
                        ),
                        fit: BoxFit.fill
                    ),
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 10, top: 110, right: 180),
                    child: Text(
                      "Books to Read",
                      style: GoogleFonts.aBeeZee(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 75,
              ),
              const Text(
                "** Tap on a Box to View Videos **",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class StudyingTips extends StatelessWidget {

  final List<VideoInfo> videoInfos;
  final void Function(List<VideoInfo> videoInfos) onWatchYoutube;
  final String whichButton;

  const StudyingTips({
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
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                    height: 100,
                    width: 400,
                    decoration: const BoxDecoration(
                      color: Colors.red,
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

  /*@override
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
  }*/

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
