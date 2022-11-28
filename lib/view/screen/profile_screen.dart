// ignore_for_file: prefer_const_literals_to_create_immutables, unnecessary_const, prefer_const_constructors, sized_box_for_whitespace, import_of_legacy_library_into_null_safe, duplicate_import

import 'dart:developer';

import 'package:animations/animations.dart';
import 'package:diet_trainingapp/data_repository/db_helper.dart';
import 'package:diet_trainingapp/model/user.dart';
import 'package:diet_trainingapp/provider/diet_app_provider.dart';
import 'package:diet_trainingapp/view/screen/add_new_item_screen.dart';
import 'package:diet_trainingapp/view/screen/user_setting.dart';
import 'package:diet_trainingapp/view/screen/workout_screen.dart';
import 'package:diet_trainingapp/view/widget/card_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../data/dummy_data.dart';
import '../widget/diet_progress.dart';
import '../widget/radial_progress.dart';
import 'package:intl/intl.dart';

class MyHome extends StatelessWidget {
  PageController pageController = PageController();
  List<Widget> pages = [ProfileScreen(), AddNewItem(), UserSettingScreen()];

  @override
  Widget build(BuildContext context) {
    onPageChanged(int i) {
      Provider.of<DietProvider>(context, listen: false).setIndes(i);
    }

    oneItemTap(int selectedI) {
      pageController.jumpToPage(selectedI);
    }

    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
        child: BottomNavigationBar(onTap: oneItemTap, iconSize: 35,
            // unselectedIconTheme: IconThemeData(color: Colors.black12),
            // selectedIconTheme: IconThemeData(color: const Color(0xFF200087)),
            items: [
              BottomNavigationBarItem(
                label: '',
                icon: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Icon(Icons.home,
                      color: Provider.of<DietProvider>(context)
                                  .selectedIndexScreen ==
                              0
                          ? Color(0xFF200087)
                          : Colors.black12),
                ),
              ),
              BottomNavigationBarItem(
                  label: '',
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Icon(
                      Icons.add_shopping_cart,
                      color: Provider.of<DietProvider>(context)
                                  .selectedIndexScreen ==
                              1
                          ? Color(0xFF200087)
                          : Colors.black12,
                    ),
                  )),
              BottomNavigationBarItem(
                  label: '',
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Icon(
                      Icons.person,
                      color: Provider.of<DietProvider>(context)
                                  .selectedIndexScreen ==
                              2
                          ? Color(0xFF200087)
                          : Colors.black12,
                    ),
                  )),
            ]),
      ),
      body: PageView(
        controller: pageController,
        children: pages,
        onPageChanged: onPageChanged,
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  static final today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Provider.of<DietProvider>(context).isDarkMode
          ? Colors.black
          : const Color(0xFFE9E9E9),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            height: height * .35,
            left: 0,
            right: 0,
            child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                    bottom: const Radius.circular(40)),
                child: Container(
                  color: Provider.of<DietProvider>(context).isDarkMode
                      ? Colors.black
                      : Colors.white,
                  padding: const EdgeInsets.only(
                      top: 40, left: 32, right: 16, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
//                             InkWell(
//                                 onTap: () {
//                                   // DbHelper.dbHelper.database.execute(
//                                   //     "DROP TABLE IF EXISTS ${DbHelper.dbHelper.userTableName}");

//                                   // User user = User(
//                                   //     name: 'Naser',
//                                   //     protein: '72',
//                                   //     carbs: '252',
//                                   //     fat: '61',
//                                   //     kcalLeft: '1731');
//                                   // Provider.of<DietProvider>(context,
//                                   //         listen: false)
//                                   //     .insertNewMeal(meals[0]);
//                                   // Provider.of<DietProvider>(context,
//                                   //         listen: false)
//                                   //     .insertNewMeal(meals[1]);
//                                   // Provider.of<DietProvider>(context,
//                                   //         listen: false)
//                                   //     .insertNewMeal(meals[2]);

// //                                   DbHelper.dbHelper.database.execute('''
// // // CREATE TABLE ${DbHelper.dbHelper.userTableName} (
// // //             ${DbHelper.dbHelper.userNameColumnName} Text PRIMARY KEY ,
// // //              ${DbHelper.dbHelper.proteinColumnName} TEXT,
// // //              ${DbHelper.dbHelper.carbsColumnName} TEXT,
// // //              ${DbHelper.dbHelper.fatColumnName} TEXT ,
// // //                ${DbHelper.dbHelper.kcalLeftColumnName} TEXT )

// // // ''');
//                                   log('success');
//                                 },
//                                 child: Icon(Icons.add)),
                            InkWell(
                                onTap: () {
                                  // Provider.of<DietProvider>(context,
                                  //         listen: false)
                                  //     .insertNewMeal();
                                  if (context.locale == Locale('ar')) {
                                    context.setLocale(Locale('en'));
                                  } else {
                                    context.setLocale(Locale('ar'));
                                  }
                                },
                                child: Icon(Icons.language)),
                            IconButton(
                                onPressed: () {
                                  Provider.of<DietProvider>(context,
                                          listen: false)
                                      .changeIsDarkMode();
                                },
                                icon: Provider.of<DietProvider>(context)
                                        .isDarkMode
                                    ? Icon(Icons.light_mode)
                                    : Icon(Icons.dark_mode)),
                          ],
                        ),
                        title: Text(
                          "${DateFormat("EEEE").format(today)},${DateFormat("d MMM").format(today)}",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 18),
                        ),
                        subtitle: Text(
                          'welcome'.tr() +
                              ' , ' +
                              Provider.of<DietProvider>(context).users[0].name,
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 22,
                          ),
                        ),
                        trailing:
                            ClipOval(child: Image.asset('images/pict.jpg')),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          RadialProgress(
                            width: width * 0.33,
                            height: width * 0.33,
                            progress: (double.parse(
                                    Provider.of<DietProvider>(context)
                                        .users[0]
                                        .kcalLeft) /
                                5000),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IngredientProgress(
                                ingredient: "Protein",
                                progress: 0.3,
                                progressColor: Colors.green,
                                leftAmount: double.parse(
                                    Provider.of<DietProvider>(context)
                                        .users[0]
                                        .protein),
                                width: width * 0.27,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              IngredientProgress(
                                ingredient: "Carbs",
                                progress: 0.2,
                                progressColor: Colors.red,
                                leftAmount: 252,
                                width: width * 0.27,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              IngredientProgress(
                                ingredient: "Fat",
                                progress: 0.1,
                                progressColor: Colors.yellow,
                                leftAmount: double.parse(
                                    Provider.of<DietProvider>(context)
                                        .users[0]
                                        .fat),
                                width: width * 0.27,
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )),
          ),
          Positioned(
            top: height * 0.38,
            left: 0,
            right: 0,
            child: Container(
              height: height * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 8, left: 32, right: 16),
                    child: Text(
                      'meals_name'.tr(),
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                  ),
                  Consumer<DietProvider>(
                    builder: (context, provider, x) {
                      return Expanded(
                          child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 32,
                            ),
                            for (int i = 0; i < provider.allMeal.length; i++)
                              MealCard(meal: provider.allMeal[i])
                          ],
                        ),
                      ));
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: OpenContainer(
                    closedElevation: 0,
                    transitionType: ContainerTransitionType.fadeThrough,
                    transitionDuration: const Duration(seconds: 1),
                    closedColor: Provider.of<DietProvider>(context).isDarkMode
                        ? Colors.black
                        : Color(0xFFE9E9E9),
                    openBuilder: (context, _) {
                      return WorkoutScreen();
                    },
                    closedBuilder: (context, VoidCallback openContainer) {
                      return GestureDetector(
                        onTap: openContainer,
                        child: Container(
                          margin: const EdgeInsets.only(
                            bottom: 60,
                            left: 32,
                            right: 32,
                          ),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  const Color(0xFF20008B),
                                  const Color(0xFF200087),
                                ],
                              )),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16.0, left: 16),
                                  child: Text(
                                    'training_label'.tr(),
                                    style: context.locale == Locale('ar')
                                        ? TextStyle(
                                            color: Colors.white70,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600)
                                        : TextStyle(
                                            color: Colors.white70,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8.0, left: 16),
                                  child: Text(
                                    'training_location'.tr(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                          decoration: BoxDecoration(
                                              color: const Color(0xFF584D9D),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(25))),
                                          padding: const EdgeInsets.all(10),
                                          child: Image.asset(
                                            'images/chest.png',
                                            color: Colors.white,
                                            width: 50,
                                            height: 50,
                                          )),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                          decoration: BoxDecoration(
                                              color: const Color(0xFF584D9D),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(25))),
                                          padding: const EdgeInsets.all(10),
                                          child: Image.asset(
                                            'images/back.png',
                                            color: Colors.white,
                                            width: 50,
                                            height: 50,
                                          )),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                          decoration: BoxDecoration(
                                              color: const Color(0xFF584D9D),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(25))),
                                          padding: const EdgeInsets.all(10),
                                          child: Image.asset(
                                            'images/biceps.png',
                                            width: 50,
                                            height: 50,
                                            color: Colors.white,
                                          )),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                        ),
                      );
                    },
                  )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
