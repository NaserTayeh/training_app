// // ignore_for_file: public_member_api_docs, sort_constructors_first, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, curly_braces_in_flow_control_structures

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

// import 'package:diet_trainingapp/model/excersise.dart';

// class VideoControlWidget extends StatelessWidget {
//   final Exercise exercise;
//   final Function onRewindVideo;
//   final Function onNextVideo;
//   final ValueChanged<bool> onTogglePlaying;
//   VideoControlWidget({
//     required this.exercise,
//     required this.onRewindVideo,
//     required this.onNextVideo,
//     required this.onTogglePlaying,
//   });

//   @override
//   Widget build(BuildContext context) {
//     Widget buildButtons(BuildContext context) {
//       Widget buildPlayButton(BuildContext context) {
//         final isLoading = exercise.controller == null ||
//             !exercise.controller.value.isInitialized;
//         if (isLoading) {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         } else if (exercise.controller.value.isPlaying) {
//           return buildButton(
//             context,
//             icon: Icon(
//               Icons.pause,
//               size: 30,
//               color: Colors.white,
//             ),
//             onClicked: () => onTogglePlaying(false),
//           );
//         } else {
//           return buildButton(
//             context,
//             icon: Icon(
//               Icons.play_arrow,
//               size: 30,
//               color: Colors.white,
//             ),
//             onClicked: () => onTogglePlaying(true),
//           );
//         }
//       }

//       return Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           IconButton(
//               onPressed: ()=> onRewindVideo(),
//               icon: const Icon(Icons.fast_rewind,
//                   color: Colors.black87, size: 32)),
//           buildPlayButton(context),
//           IconButton(
//               onPressed: ()=>onNextVideo(),
//               icon: const Icon(Icons.fast_forward,
//                   color: Colors.black87, size: 32))
//         ],
//       );
//     }

//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         color: Colors.white.withOpacity(.95),
//       ),
//       height: 142,
//       child: buildButtons(context),
//     );
//   }

//   Widget buildButton(BuildContext context,
//       {required Icon icon, required Function onClicked}) {
//     return GestureDetector(
//       onTap: onClicked(),
//       child: Container(
//         decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             boxShadow: <BoxShadow>[
//               BoxShadow(
//                   color: Color(0xFFff6363), blurRadius: 8, offset: Offset(2, 2))
//             ]),
//         child: CircleAvatar(
//           backgroundColor: Color(0xFFff6369),
//           radius: 24,
//           child: icon,
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

import '../../model/excersise.dart';

class VideoControlsWidget extends StatelessWidget {
  final Exercise exercise;
  final VoidCallback onRewindVideo;
  final VoidCallback onNextVideo;
  final ValueChanged<bool> onTogglePlaying;

  const VideoControlsWidget({
    required this.exercise,
    required this.onRewindVideo,
    required this.onNextVideo,
    required this.onTogglePlaying,
  });

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white.withOpacity(0.95),
        ),
        height: 142,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildText(
                  title: 'Duration',
                  value: '${exercise.duration.inSeconds} Seconds',
                ),
                buildText(
                  title: 'Reps',
                  value: '${exercise.noOfReps} times',
                ),
              ],
            ),
            buildButtons(context),
          ],
        ),
      );

  Widget buildText({
    required String title,
    required String value,
  }) =>
      Column(
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      );

  Widget buildButtons(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(
              Icons.fast_rewind,
              color: Colors.black87,
              size: 32,
            ),
            onPressed: onRewindVideo,
          ),
          buildPlayButton(context),
          IconButton(
            icon: Icon(
              Icons.fast_forward,
              color: Colors.black87,
              size: 32,
            ),
            onPressed: onNextVideo,
          ),
        ],
      );

  Widget buildPlayButton(BuildContext context) {
    final isLoading =
        exercise.controller == null || !exercise.controller.value.isInitialized;

    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    } else if (exercise.controller.value.isPlaying) {
      return buildButton(
        context,
        icon: Icon(Icons.pause, size: 30, color: Colors.white),
        onClicked: () => onTogglePlaying(false),
      );
    } else {
      return buildButton(
        context,
        icon: Icon(Icons.play_arrow, size: 30, color: Colors.white),
        onClicked: () => onTogglePlaying(true),
      );
    }
  }

  Widget buildButton(
    BuildContext context, {
    required Widget icon,
    required VoidCallback onClicked,
  }) =>
      GestureDetector(
        onTap: onClicked,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Color(0xFFff6369),
                blurRadius: 8,
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: CircleAvatar(
            radius: 24,
            backgroundColor: Color(0xFFff6369),
            child: icon,
          ),
        ),
      );
}
