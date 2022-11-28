// // ignore_for_file: unused_element

// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:video_player/video_player.dart';

// import '../../data/excesise_set.dart';
// import '../../model/excersise.dart';
// import '../../model/excersise_set.dart';
// import '../../provider/diet_app_provider.dart';
// import '../widget/video_controller.dart';
// import '../widget/video_player_widget.dart';

// class ExcsersisesScreen extends StatelessWidget {
//   late final ExerciseSet exerciseS = exerciseSets[0];

//   final controller = PageController();

//   @override
//   Widget build(BuildContext context) {
//     Widget buildVideos() => PageView(
//           controller: controller,
//           onPageChanged: (value) {
//             Provider.of<DietProvider>(context, listen: false)
//                 .setVideoControl(exerciseS.exercises[value]);
//           },
//           children: exerciseS.exercises
//               .map((e) => VideoPlayerWidget(
//                   exercise: e,
//                   onInitialized: () =>
//                       Provider.of<DietProvider>(context, listen: false)
//                           .notify()))
//               .toList(),
//         );
//     Widget buildVideoControll() => VideoControlWidget(
//           exercise: Provider.of<DietProvider>(context).exercise,
//           onTogglePlaying: (isPlaying) {
//             Future.delayed(Duration.zero, () {
//               //your code goes here
//               log(isPlaying.toString());
//               if (isPlaying) {
//                 Provider.of<DietProvider>(context, listen: false)
//                     .playPauseControl(false);
//               } else {
//                 Provider.of<DietProvider>(context, listen: false)
//                     .playPauseControl(true);
//               }
//             });
//           },
//           onNextVideo: () => controller.nextPage(
//               duration: Duration(milliseconds: 300), curve: Curves.easeIn),
//           onRewindVideo: () => controller.previousPage(
//               duration: Duration(milliseconds: 300), curve: Curves.easeIn),
//         );

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('exercise.name'),
//         centerTitle: true,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       extendBodyBehindAppBar: true,
//       body: Stack(
//         children: [
//           buildVideos(),
//           Positioned(
//               bottom: 20, right: 50, left: 50, child: buildVideoControll())
//         ],
//       ),
//     );
//   }

import 'package:flutter/material.dart';

import '../../model/excersise.dart';
import '../../model/excersise_set.dart';
import '../widget/video_controller.dart';
import '../widget/video_player_widget.dart';

class ExercisePage extends StatefulWidget {
  final ExerciseSet exerciseSet;

  const ExercisePage({
    required this.exerciseSet,
  });

  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  final controller = PageController();
  late Exercise currentExercise;

  @override
  void initState() {
    super.initState();

    currentExercise = widget.exerciseSet.exercises.first;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(currentExercise.name),
          centerTitle: true,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            buildVideos(),
            Positioned(
              bottom: 20,
              right: 50,
              left: 50,
              child: buildVideoControls(),
            )
          ],
        ),
      );

  Widget buildVideos() => PageView(
        controller: controller,
        onPageChanged: (index) => setState(() {
          currentExercise = widget.exerciseSet.exercises[index];
        }),
        children: widget.exerciseSet.exercises
            .map((exercise) => VideoPlayerWidget(
                  exercise: exercise,
                  onInitialized: () => setState(() {}),
                ))
            .toList(),
      );

  Widget buildVideoControls() => VideoControlsWidget(
        exercise: currentExercise,
        onTogglePlaying: (isPlaying) {
          setState(() {
            if (isPlaying) {
              currentExercise.controller.play();
            } else {
              currentExercise.controller.pause();
            }
          });
        },
        onNextVideo: () => controller.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        ),
        onRewindVideo: () => controller.previousPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        ),
      );
}
