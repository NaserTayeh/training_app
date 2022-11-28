import 'dart:developer';

import 'package:diet_trainingapp/data/dummy_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/excesise_set.dart';
import '../data_repository/db_helper.dart';
import '../model/excersise.dart';
import '../model/meal.dart';
import '../model/user.dart';

class DietProvider extends ChangeNotifier {
  bool isDarkMode = false;
  List<IconData> sharedIcon = [
    Icons.check_circle_outline_outlined,
    Icons.check_circle_outline_outlined,
    Icons.check_circle_outline_outlined,
    Icons.check_circle_outline_outlined,
    Icons.check_circle_outline_outlined,
    Icons.check_circle_outline_outlined,
    Icons.check_circle_outline_outlined,
    Icons.check_circle_outline_outlined,
    Icons.check_circle_outline_outlined,
    Icons.check_circle_outline_outlined,
    Icons.check_circle_outline_outlined,
    Icons.check_circle_outline_outlined,
  ];
  List<Meal> allMeal = [];
  List<User> users = [
    User(
        name: 'name',
        protein: 'protein',
        carbs: 'carbs',
        fat: 'fat',
        kcalLeft: 'kcalLeft')
  ];
  int selectedIndexScreen = 0;
  late Exercise exercise = exerciseSets[0].exercises[0];
  playPauseControl(bool i) {
    if (i) {
      exercise.controller.play();
      notifyListeners();
    } else {
      exercise.controller.pause();
      notifyListeners();
    }
  }

  setVideoControl(value) {
    exercise = value;
    notifyListeners();
  }

  notify() {
    notifyListeners();
  }

  setIndes(int i) {
    selectedIndexScreen = i;
    notifyListeners();
  }

  DietProvider() {
    getAllMeals();
    getAllUser();
  }
  getAllMeals() async {
    allMeal = await DbHelper.dbHelper.getAllMeals();

    log("all = " + allMeal.length.toString());
    notifyListeners();
  }

  getAllUser() async {
    users = await DbHelper.dbHelper.getAllUsers();
    users.forEach((element) {
      print(element.fat);
    });
    log("all user  =  = " + users.length.toString());
    notifyListeners();
  }

  updateUser(User userModel) async {
    await DbHelper.dbHelper.updateUser(userModel);
    getAllUser();
  }

  insertNewMeal(Meal meal) async {
    // Meal mealModel =
    //     Meal(title: textEditingController.text, isComplete: false);
    // print(taskModel.title.toString());
    await DbHelper.dbHelper.insertNewMeal(meal);
    getAllMeals();
  }

  insertNewUser(User user) async {
    // Meal mealModel =
    //     Meal(title: textEditingController.text, isComplete: false);
    // print(taskModel.title.toString());
    await DbHelper.dbHelper.insertNewUser(user);
    // getAllMeals();
  }

  deleteTask(Meal meal) async {
    await DbHelper.dbHelper.deleteMeal(meal);
    getAllMeals();
  }

  // updateTask(TaskModel taskModel) async {
  //   await DbHelper.dbHelper.updateTask(taskModel);
  //   getAllTasks();
  // }
  changeIsDarkMode() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}
