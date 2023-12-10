import '../views/YoutubeView.dart';

class VideoRepository {
  static final List<VideoInfo> _videoInfos = [
    VideoInfo(
        topic: 'Study Habits',
        videoName: '9 Best Study Tips',
        videoUrl: 'https://www.youtube.com/watch?v=p60rN9JEapg&ab_channel=AsapSCIENCE'),
    VideoInfo(
        topic: 'Study Habits',
        videoName: 'Best Ways to Study',
        videoUrl: 'https://www.youtube.com/watch?v=VJbKXmujI00&ab_channel=TheInfographicsShow'),
    VideoInfo(
        topic: 'Useful Info',
        videoName: '100+ Computer Science Concepts ',
        videoUrl: 'https://www.youtube.com/watch?v=-uleG_Vecis&ab_channel=Fireship'),
    VideoInfo(
        topic: 'Useful Info',
        videoName: 'Getting the Most Out of Reading',
        videoUrl: 'https://www.youtube.com/watch?v=0h_fNsGW47s&ab_channel=EngineeringwithUtsav'),
    VideoInfo(
        topic: 'Useful Info',
        videoName: 'How I Would Learn to Code',
        videoUrl: 'https://www.youtube.com/watch?v=k9WqpQp8VSU&ab_channel=NamanhKapur'),
    VideoInfo(
        topic: 'Books to Read',
        videoName: 'Must-Read Software Engineering Books',
        videoUrl: 'https://www.youtube.com/watch?v=4skMTET0yuU&ab_channel=EngineeringwithUtsav'),
    VideoInfo(
        topic: 'Books to Read',
        videoName: 'MIT Computer Scientist\'s First Books',
        videoUrl: 'https://www.youtube.com/watch?v=7PbuWwWXftg&ab_channel=MITCSAIL'),

  ];

  static List<VideoInfo> get videoInfos => _videoInfos;

  static void addVideo(VideoInfo videoInfo) {
    _videoInfos.add(videoInfo);
  }

  static void removeVideo(VideoInfo videoInfo) {
    _videoInfos.remove(videoInfo);
  }

  static void updateVideo(int index, VideoInfo videoInfo) {
    if (index >= 0 && index < _videoInfos.length) {
      _videoInfos[index] = videoInfo;
    }
  }
}
