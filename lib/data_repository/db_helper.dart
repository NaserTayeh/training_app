import 'dart:developer';
import 'dart:io';

import 'package:diet_trainingapp/model/meal.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../data/dummy_data.dart';
import '../model/user.dart';

class DbHelper {
  late Database database;
  static DbHelper dbHelper = DbHelper();
  final String userTableName = 'users';
  final String userNameColumnName = 'username';
  final String proteinColumnName = 'protein';
  final String carbsColumnName = 'carbs';
  final String fatColumnName = 'fat';
  final String kcalLeftColumnName = 'kcalleft';

  final String tableName = 'meals';
  final String idColumnName = 'id';
  final String titleColumnName = 'title';
  final String typeColumnName = 'type';
  final String kcalColumnName = 'kcal';
  final String timeColumnName = 'time';
  final String preparationColumnName = 'preparation';
  final String ingredientsColumnName = 'ingredients';
  final String imagePathColumnName = 'imagePath';
  initDatabase() async {
    database = await createDatabasConnection();
  }

  Future<void> DropTableIfExistsThenReCreate() async {
    // await database.execute("DROP TABLE IF EXISTS $tableName");

    // database.execute('''CREATE TABLE $tableName (
    //         $idColumnName INTEGER PRIMARY KEY AUTOINCREMENT,
    //          $titleColumnName TEXT,
    //          $typeColumnName TEXT,
    //          $kcalColumnName INTEGER,
    //            $timeColumnName INTEGER,
    //            $preparationColumnName TEXT,
    //            $ingredientsColumnName TEXT,
    //            $imagePathColumnName TEXT)
    //       ''');
    await insertNewMeal(meals[1]);
    bool flag = false;
    List<Map<String, dynamic>> data = await database.query(tableName);
    data.map((e) => Meal.fromMap(e)).toList().forEach((element) {
      flag = true;
      log('element' + element.toString());
    });
    if (!flag) log('nothing');

    //and finally here we recreate our beloved "tableName" again which needs
    //some columns initialization
  }

  Future<int> insertNewMeal(Meal mealModel) async {
    int i = await database.insert(tableName, mealModel.toMap());
    return i;
  }

  Future<int> insertNewUser(User user) async {
    int i = await database.insert(userTableName, user.toMap());
    return i;
  }

  Future<List<Meal>> getAllMeals() async {
    List<Map<String, dynamic>> data = await database.query(tableName);
    return data.map((e) => Meal.fromMap(e)).toList();
  }

  Future<List<User>> getAllUsers() async {
    List<Map<String, dynamic>> data = await database.query(userTableName);
    return data.map((e) => User.fromMap(e)).toList();
  }

  Future<int> deleteMeal(Meal mealModel) async {
    int count = await database
        .delete(tableName, where: 'id=?', whereArgs: [mealModel.id]);
    return count;
  }

  updateMeal(Meal mealModel) async {
    /*
    update tableNAme set name = value where id  = 5  
    */
    // database.update(tableName, {isCompleteColumnName: newValue},
    //     where: 'id=?', whereArgs: [mealModel.id]);
  }
  updateUser(User userModel) async {
    /*
    update tableNAme set name = value where id  = 5  
    */
    database.update(
        userTableName,
        {
          fatColumnName: userModel.fat,
          proteinColumnName: userModel.protein,
          kcalLeftColumnName: userModel.kcalLeft
        },
        where: 'username=?',
        whereArgs: [userModel.name]);
  }

  printData() {
    // database.execute('select from ')
  }

  Future<Database> createDatabasConnection() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String folderPath = directory.path;
    database = await openDatabase(folderPath + '/$tableName.db', version: 1,
        onCreate: ((db, version) {
      db.execute('''CREATE TABLE $tableName (
            $idColumnName INTEGER PRIMARY KEY AUTOINCREMENT,
             $titleColumnName TEXT,
             $typeColumnName TEXT,
             $kcalColumnName INTEGER,
               $timeColumnName INTEGER,
               $preparationColumnName TEXT,
               $ingredientsColumnName TEXT,
               $imagePathColumnName TEXT)
          ''');
    }), onOpen: ((db) => log('DB is Connected')));
    return database;
  }

  // Future<int> insertNewTask(TaskModel taskModel) async {
  //   int i = await database.insert(tableName, taskModel.toMap());
  //   return i;
  // }
}
