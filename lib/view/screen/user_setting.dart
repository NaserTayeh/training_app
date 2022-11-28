// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:developer';

import 'package:diet_trainingapp/provider/diet_app_provider.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../model/user.dart';

class UserSettingScreen extends StatelessWidget {
  final List<Flushbar> flushBars = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController protienController = TextEditingController();
  TextEditingController fatController = TextEditingController();
  TextEditingController kcalController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
          color: Color.fromARGB(255, 42, 25, 103),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings),
            color: Color.fromARGB(255, 12, 40, 63),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                'Edit Profile',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 15),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0, 10),
                            )
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('images/pict.jpg'))),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 4,
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor),
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 22, 27, 121)),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              buildTextField(
                  'Full Name',
                  Provider.of<DietProvider>(context).users[0].name,
                  nameController),
              buildTextField(
                  'Protins',
                  Provider.of<DietProvider>(context).users[0].protein,
                  protienController),
              buildTextField(
                  'Fat',
                  Provider.of<DietProvider>(context).users[0].fat,
                  fatController),
              buildTextField(
                  'Kcal Left',
                  Provider.of<DietProvider>(context).users[0].kcalLeft,
                  kcalController),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: OutlinedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.red)))),
                        onPressed: () {
                          nameController.text =
                              Provider.of<DietProvider>(context, listen: false)
                                  .users[0]
                                  .name;
                          protienController.text =
                              Provider.of<DietProvider>(context, listen: false)
                                  .users[0]
                                  .protein;
                          fatController.text =
                              Provider.of<DietProvider>(context, listen: false)
                                  .users[0]
                                  .fat;
                          kcalController.text =
                              Provider.of<DietProvider>(context, listen: false)
                                  .users[0]
                                  .kcalLeft;

                          showTop(
                              context,
                              'Successfull',
                              'Information restored Successfully ',
                              Icons.restore);
                        },
                        child: Text(
                          'cancel',
                          style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 2.2,
                              color: Colors.black),
                        )),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // log('name' + nameController.text);
                      // log('fat' + fatController.text);
                      // log('kcal' + kcalController.text);
                      // log('prot' + protienController.text);
                      User user = User(
                          name: 'Naser',
                          protein: protienController.text,
                          carbs: '252',
                          fat: fatController.text,
                          kcalLeft: kcalController.text);
                      Provider.of<DietProvider>(context, listen: false)
                          .updateUser(user);
                      showTop(
                          context,
                          'Successfull',
                          'Information changed Successfully ',
                          Icons.check_circle_outline);
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 44, 6, 113)),

                        //            color: Color.fromARGB(255, 12, 10, 113),
                        // elevation: 2,
                        // padding: EdgeInsets.symmetric(horizontal: 50),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.grey)))),
                    child: Text(
                      'SAVE',
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String placeHolder,
      TextEditingController textEditingController) {
    textEditingController.text = placeHolder;
    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeHolder,
            hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
      ),
    );
  }

  showTop(BuildContext context, String title, String subTitle, IconData icon) =>
      show(
        context,
        Flushbar(
          icon: Icon(icon, size: 32, color: Colors.green),
          shouldIconPulse: false,
          title: title,
          message: subTitle,

          onTap: ((flushbar) {
            print('clicked bar');
          }),
          animationDuration: Duration(milliseconds: 1000),
          duration: Duration(seconds: 2),

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
