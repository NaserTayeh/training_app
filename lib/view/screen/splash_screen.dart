// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:diet_trainingapp/view/screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 6)).then((value) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) {
          return MyHome();
        },
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('images/logo.png'),
              width: 300,
            ),
            SizedBox(
              height: 50,
            ),
            SpinKitFoldingCube(
              color: Color.fromARGB(255, 25, 12, 163),
              size: 50.0,
            )
          ],
        ),
      ),
    );
  }
}
