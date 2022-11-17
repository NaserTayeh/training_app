// ignore_for_file: prefer_const_literals_to_create_immutables, unnecessary_const, prefer_const_constructors, sized_box_for_whitespace, import_of_legacy_library_into_null_safe, duplicate_import

import 'package:diet_trainingapp/view/widget/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/dummy_data.dart';
import '../widget/radial_progress.dart';
import 'package:intl/intl.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final today = DateTime.now();
    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
        child: BottomNavigationBar(
            iconSize: 35,
            unselectedIconTheme: IconThemeData(color: Colors.black12),
            selectedIconTheme: IconThemeData(color: const Color(0xFF200087)),
            items: [
              BottomNavigationBarItem(
                label: '',
                icon: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Icon(Icons.home),
                ),
              ),
              BottomNavigationBarItem(
                  label: '',
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Icon(Icons.search),
                  )),
              BottomNavigationBarItem(
                  label: '',
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Icon(Icons.person),
                  )),
            ]),
      ),
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
                  color: Colors.white,
                  padding: const EdgeInsets.only(
                      top: 40, left: 32, right: 16, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(
                          "${DateFormat("EEEE").format(today)},${DateFormat("d MMM").format(today)}",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 18),
                        ),
                        subtitle: Text(
                          'Hello , David',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 26,
                              color: Colors.black),
                        ),
                        trailing:
                            ClipOval(child: Image.asset('images/user.jpg')),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          RadialProgress(
                            width: height * 0.18,
                            height: height * 0.18,
                            progress: 0.75,
                          ),
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
                      'MEALS FOR TODAY ',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 32,
                        ),
                        for (int i = 0; i < meals.length; i++)
                          MealCard(meal: meals[i])
                      ],
                    ),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: Container(
                    margin: const EdgeInsets.only(
                      bottom: 60,
                      left: 32,
                      right: 32,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
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
                            padding: const EdgeInsets.only(top: 16.0, left: 16),
                            child: Text(
                              'YOUR NEXT WORKOUT',
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 16),
                            child: Text(
                              'UPPER BODY',
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
