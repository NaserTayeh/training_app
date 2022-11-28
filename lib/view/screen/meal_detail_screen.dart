// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:diet_trainingapp/view/screen/notification_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../model/meal.dart';
import '../../provider/diet_app_provider.dart';

class MealDetailScreen extends StatelessWidget {
  final Meal meal;

  MealDetailScreen({required this.meal});
  final List<Flushbar> flushBars = [];

  @override
  Widget build(BuildContext context) {
    List ingredients = meal.ingredients.split(",");
    Future showToast(String message) async {
      await Fluttertoast.cancel;
      return Fluttertoast.showToast(msg: message, fontSize: 18);
    }

    return Scaffold(
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animationDuration: Duration(milliseconds: 500),
        // icon: Icons.share,
        backgroundColor: Color(0xFF200087),
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        children: [
          SpeedDialChild(
              onTap: () {
                showTop(context);
              },
              backgroundColor: Colors.red,
              label: 'delete',
              child: Icon(Icons.delete_forever_rounded)),
          SpeedDialChild(
              // onTap: () => showToast('selected copy'),
              backgroundColor: Colors.green,
              label: 'Edit',
              child: Icon(Icons.edit))
        ],
      ),
      backgroundColor: Provider.of<DietProvider>(context).isDarkMode
          ? Colors.black
          : const Color(0xFFE9E9E9),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            snap: true,
            floating: true,
            backgroundColor: const Color(0xFF200087),
            expandedHeight: 300,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(40))),
            flexibleSpace: FlexibleSpaceBar(
                background: ClipRRect(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
              child: Image.asset(
                meal.imagePath,
                fit: BoxFit.cover,
              ),
            )),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            // Container(
            //   color: Colors.blue,
            //   child: IconButton(
            //       onPressed: () {
            //         showTop(context);

            //         // Provider.of<DietProvider>(context, listen: false)
            //         //     .deleteTask(meal);
            //         // Navigator.of(context).pop();
            //       },
            //       icon: Icon(Icons.delete_forever_rounded)),
            // ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              title: Text(
                meal.mealTime.toUpperCase(),
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 14,
                    color: Colors.blueGrey),
              ),
              subtitle: Text(
                meal.name,
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 24,
                    color: Colors.black),
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(),
                      Text(
                        "${meal.kiloCaloriesBurnt} kcal",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.access_time,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${meal.timeTaken} mins',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "ingredint_label".tr(),
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 14,
                    color: Colors.blueGrey),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < ingredients.length; i++)
                    Text(
                      ingredients[i],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "prepartion_label".tr(),
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 14,
                    color: Colors.blueGrey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
              child: Text(
                meal.preparation,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            )
          ]))
        ],
      ),
    );
  }

  showTop(BuildContext context) => show(
        context,
        Flushbar(
          icon: Icon(Icons.delete, size: 32, color: Colors.white),
          shouldIconPulse: false,
          title: 'Warning',
          message: 'confirm to delete ? ',
          mainButton: Row(
            children: [
              FlatButton(
                  hoverColor: Colors.red,
                  onPressed: () {
                    //  .dismiss(true);
                    Provider.of<DietProvider>(context, listen: false)
                        .deleteTask(meal);
                    Navigator.of(context).pop();
                    Navigator.pop(context);
                  },
                  child: Text(
                    'delete',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )),
              SizedBox(
                width: 2,
              ),
              FlatButton(
                  onPressed: () {
                    //  .dismiss(true);
                    Navigator.pop(context);
                  },
                  child: Text(
                    'cancel',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )),
            ],
          ),
          onTap: ((flushbar) {
            print('clicked bar');
          }),
          animationDuration: Duration(milliseconds: 1000),

          // duration: Duration(seconds: 100),
          boxShadows: [
            BoxShadow(
                color: Color(0xFF6C42F7), offset: Offset(2, 2), blurRadius: 32)
          ],
          backgroundGradient: LinearGradient(
              colors: [Color(0xFF6C42F7), Color.fromARGB(255, 51, 18, 116)]),
          flushbarPosition: FlushbarPosition.TOP,
          margin: EdgeInsets.fromLTRB(8, kToolbarHeight + 8, 8, 0),
          dismissDirection: FlushbarDismissDirection.HORIZONTAL,
          borderRadius: 16,
        ),
      );

  Future show(BuildContext context, Flushbar newFlushBar) async {
    await Future.wait(flushBars.map((flushBar) => flushBar.dismiss()).toList());
    flushBars.clear();

    newFlushBar.show(context);
    flushBars.add(newFlushBar);
  }
}
