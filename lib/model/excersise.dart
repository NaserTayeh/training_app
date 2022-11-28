import 'package:video_player/video_player.dart';

class Exercise {
  String name;
  Duration duration = Duration(seconds: 1);
  int noOfReps;
  String videoUrl;
  VideoPlayerController controller = VideoPlayerController.asset('dataSource');

  Exercise({
    required this.name,
    required this.duration,
    required this.noOfReps,
    required this.videoUrl,
  });
}
