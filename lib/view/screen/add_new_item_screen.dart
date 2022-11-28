// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, sort_child_properties_last

import 'dart:developer';

import 'package:diet_trainingapp/model/meal.dart';
import 'package:diet_trainingapp/view/screen/profile_screen.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Theme/theme_shared.dart';
import '../../provider/diet_app_provider.dart';
import '../widget/header_widget.dart';

class AddNewItem extends StatefulWidget {
  const AddNewItem({Key? key}) : super(key: key);

  @override
  _AddNewItemState createState() => _AddNewItemState();
}

class _AddNewItemState extends State<AddNewItem> {
  final List<Flushbar> flushBars = [];

  double _headerHeight = 250;
  Key _formKey = GlobalKey<FormState>();
  late String valueOF = 'BREAKFAST';
  var dropdownItems = [DropdownMenuItem(child: Text('A'))];
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController mealTimeTextEditingController = TextEditingController();
  TextEditingController textEditingController = TextEditingController();
  TextEditingController kcalTextEditingController = TextEditingController();
  TextEditingController ingredaintTextEditingController =
      TextEditingController();
  TextEditingController prepartionTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Provider.of<DietProvider>(context).isDarkMode
          ? Colors.black
          : Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios)),
              Container(
                height: _headerHeight,
                child: HeaderWidget(_headerHeight - 40, true,
                    Icons.playlist_add), //let's create a common header widget
              ),
            ]),
            Container(
              child: Container(
                  padding: EdgeInsets.fromLTRB(20, 2, 20, 10),
                  margin: EdgeInsets.fromLTRB(
                      20, 2, 20, 10), // This will be the login form
                  child: Column(
                    children: [
                      // Text(
                      //   'Signin into your account',
                      //   style: TextStyle(color: Colors.grey),
                      // ),
                      Container(
                          decoration: BoxDecoration(
                              // border: Border.all(color: Colors.blueAccent)
                              ),
                          child: Provider.of<DietProvider>(context).isDarkMode
                              ? Icon(
                                  Icons.add,
                                  color: Colors.black,
                                )
                              : Image.asset('images/img.gif',
                                  width: 200, height: 150)),
                      // SizedBox(height: 30.0),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                child: TextField(
                                  controller: nameTextEditingController,
                                  decoration: ThemeHelper().textInputDecoration(
                                      'Meal Name',
                                      'Enter your Meal name',
                                      Provider.of<DietProvider>(context)
                                              .isDarkMode
                                          ? Colors.black
                                          : Colors.white),
                                ),
                                decoration:
                                    ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 15.0),
                              Container(
                                child: TextField(
                                  controller: mealTimeTextEditingController,
                                  decoration: ThemeHelper().textInputDecoration(
                                      'Meal Time ',
                                      'BREAKFAST',
                                      Provider.of<DietProvider>(context)
                                              .isDarkMode
                                          ? Colors.black
                                          : Colors.white),
                                ),
                                decoration:
                                    ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 15.0),
                              Container(
                                child: TextField(
                                  controller: kcalTextEditingController,
                                  decoration: ThemeHelper().textInputDecoration(
                                      'kcal ',
                                      '80 kcal',
                                      Provider.of<DietProvider>(context)
                                              .isDarkMode
                                          ? Colors.black
                                          : Colors.white),
                                ),
                                decoration:
                                    ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 15.0),

                              Container(
                                child: TextField(
                                  controller: ingredaintTextEditingController,
                                  decoration: ThemeHelper().textInputDecoration(
                                      'ingredient ',
                                      '1/2water,1suggar',
                                      Provider.of<DietProvider>(context)
                                              .isDarkMode
                                          ? Colors.black
                                          : Colors.white),
                                ),
                                decoration:
                                    ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              // DropdownButton<String>(
                              //   value: valueOF,
                              //   items: <String>[
                              //     'BREAKFAST',
                              //     'DINNER',
                              //     'LUNCH',
                              //     'D'
                              //   ].map((String value) {
                              //     return DropdownMenuItem<String>(
                              //       value: value,
                              //       child: Text(value),
                              //     );
                              //   }).toList(),
                              //   onChanged: (v) {
                              //     valueOF = v!;
                              //     setState(() {});
                              //   },
                              // ),
                              // DropdownButtonFormField(items: dropdownItems,

                              //  ),
                              SizedBox(height: 15.0),

                              TextField(
                                controller: prepartionTextEditingController,
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(1.0),
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(1.0),
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade400)),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(1.0),
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 2.0)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(1.0),
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 2.0)),
                                    labelText: 'preparation',
                                    hintText:
                                        'write preparation steps here\n\n\n\n\n'),
                              ),
                              SizedBox(height: 15.0),

                              Container(
                                decoration:
                                    ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                    ),
                                    minimumSize:
                                        MaterialStateProperty.all(Size(50, 50)),
                                    backgroundColor: MaterialStateProperty.all(
                                        Color(0xFF200087)),
                                    shadowColor: MaterialStateProperty.all(
                                        Color.fromARGB(255, 67, 48, 130)),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(40, 0, 40, 10),
                                    child: Text(
                                      'ADD MEAL'.toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                  onPressed: () {
                                    //After successful login we will redirect to profile page. Let's create profile page now
                                    // log(nameTextEditingController.text);
                                    // log(mealTimeTextEditingController.text);
                                    // log(kcalTextEditingController.text);
                                    // log(ingredaintTextEditingController.text);
                                    // log(prepartionTextEditingController.text);
                                    Meal meal = Meal(
                                        id: 1,
                                        mealTime:
                                            mealTimeTextEditingController.text,
                                        name: nameTextEditingController.text,
                                        imagePath: 'images/newitem.jpg',
                                        kiloCaloriesBurnt:
                                            kcalTextEditingController.text,
                                        timeTaken: '15',
                                        ingredients:
                                            ingredaintTextEditingController
                                                .text,
                                        preparation:
                                            prepartionTextEditingController
                                                .text);
                                    Provider.of<DietProvider>(context,
                                            listen: false)
                                        .insertNewMeal(meal);
                                    showTop(context);
                                    // Navigator.pushReplacement(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             ProfileScreen()));
                                  },
                                ),
                              ),
                            ],
                          )),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  showTop(BuildContext context) => show(
        context,
        Flushbar(
          icon: Icon(Icons.check_circle, size: 32, color: Colors.green),
          shouldIconPulse: false,
          title: 'Successfull',
          message: 'NEW MEAL ADDED SUCCESSFULLY',
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
          duration: Duration(seconds: 2),
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
