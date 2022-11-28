// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:diet_trainingapp/data_repository/db_helper.dart';

class Meal {
  late int id;
  late String mealTime, name, imagePath, kiloCaloriesBurnt, timeTaken;
  late String preparation;
  late String ingredients;
  Meal({
    required this.id,
    required this.mealTime,
    required this.name,
    required this.imagePath,
    required this.kiloCaloriesBurnt,
    required this.timeTaken,
    required this.ingredients,
    required this.preparation,
  });

  toMap() {
    return {
      DbHelper.dbHelper.typeColumnName: mealTime,
      DbHelper.dbHelper.ingredientsColumnName: ingredients,
      DbHelper.dbHelper.preparationColumnName: preparation,
      DbHelper.dbHelper.timeColumnName: timeTaken,
      DbHelper.dbHelper.kcalColumnName: kiloCaloriesBurnt,
      DbHelper.dbHelper.imagePathColumnName: imagePath,
      DbHelper.dbHelper.titleColumnName: name,
    };
  }

  Meal.fromMap(Map map) {
    id = map[DbHelper.dbHelper.idColumnName];
    name = map[DbHelper.dbHelper.titleColumnName].toString();
    imagePath = map[DbHelper.dbHelper.imagePathColumnName].toString();
    kiloCaloriesBurnt = map[DbHelper.dbHelper.kcalColumnName].toString();
    timeTaken = map[DbHelper.dbHelper.timeColumnName].toString();
    preparation = map[DbHelper.dbHelper.preparationColumnName].toString();
    ingredients = map[DbHelper.dbHelper.ingredientsColumnName].toString();
    mealTime = map[DbHelper.dbHelper.typeColumnName].toString();
  }
}
