import 'package:flutter/material.dart';

import 'excersise.dart';

enum ExerciseType { low, mid, hard }

String getExerciseName(ExerciseType type) {
  switch (type) {
    case ExerciseType.hard:
      return 'Hard';
      break;
    case ExerciseType.mid:
      return 'Medium';
      break;
    case ExerciseType.low:
      return 'Easy';
      break;
    default:
      return 'All';
      break;
  }
}

class ExerciseSet {
  String name;
  List<Exercise> exercises;
  String imageUrl;
  ExerciseType exerciseType;
  Color color;

  ExerciseSet({
    required this.name,
    required this.exercises,
    required this.imageUrl,
    required this.exerciseType,
    required this.color,
  });

  String get totalDuration {
    final dynamic duration = exercises.fold(
      Duration.zero,
      (previous, element) {
        if (element.duration != null) {
          return (int.parse(previous.toString()) +
              int.parse((element.duration.toString())));
        }
      },
    );

    return duration.inMinutes;
  }
}
