// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:diet_trainingapp/data/dummy_data.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../data/excesise_set.dart';
import '../../provider/diet_app_provider.dart';
import 'excersises_screen.dart';

class WorkoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    return Scaffold(
      backgroundColor: Provider.of<DietProvider>(context).isDarkMode
          ? Colors.black
          : const Color(0xFF200087),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.close, color: Colors.white, size: 40)),
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                title: Text(
                  "${DateFormat("EEEE").format(today)},${DateFormat("d MMM").format(today)}",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white),
                ),
                subtitle: Text(
                  "training_location".tr(),
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 24,
                      color: Colors.white),
                ),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.access_time,
                          color: Colors.white30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'time'.tr(),
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.speed_rounded,
                          color: Colors.white30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'level'.tr(),
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              for (int i = 0; i < upperBody.length; i++)
                Column(
                  children: [
                    for (int j = 0; j < upperBody[i].length; j++)
                      GestureDetector(
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return ExercisePage(
                              exerciseSet:
                                  exerciseSets[j + (upperBody.length - 1) * i],
                            );
                          },
                        )),
                        child: ListTile(
                          leading: Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xFF584D9D),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              padding: const EdgeInsets.all(6),
                              child: Image.asset(
                                upperBody[i][j].imagePath,
                                color: Colors.white,
                                width: 45,
                                height: 45,
                              )),
                          title: Text(upperBody[i][j].name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600)),
                          subtitle: Text(
                            upperBody[i][j].instruction,
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
