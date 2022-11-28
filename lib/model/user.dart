import '../data_repository/db_helper.dart';

class User {
  late String name;
  late String protein;
  late String carbs;
  late String fat;
  late String kcalLeft;
  User({
    required this.name,
    required this.protein,
    required this.carbs,
    required this.fat,
    required this.kcalLeft,
  });
  toMap() {
    return {
      DbHelper.dbHelper.userNameColumnName: name,
      DbHelper.dbHelper.proteinColumnName: protein,
      DbHelper.dbHelper.carbsColumnName: carbs,
      DbHelper.dbHelper.fatColumnName: fat,
      DbHelper.dbHelper.kcalLeftColumnName: kcalLeft,
    };
  }

  User.fromMap(Map map) {
    name = map[DbHelper.dbHelper.userNameColumnName];
    protein = map[DbHelper.dbHelper.proteinColumnName].toString();
    carbs = map[DbHelper.dbHelper.carbsColumnName].toString();
    fat = map[DbHelper.dbHelper.fatColumnName].toString();
    kcalLeft = map[DbHelper.dbHelper.kcalLeftColumnName].toString();
  }
}
