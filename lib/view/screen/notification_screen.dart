// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

// class FlashScreen extends StatefulWidget {
//   @override
//   State<FlashScreen> createState() => _FlashScreen();
// }

class FlashScreen extends StatelessWidget {
  late String i;
  final List<Flushbar> flushBars = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => showTop(context),
                child: Text('Top Snack bar')),
            ElevatedButton(
                onPressed: () => showBlurr(context),
                child: Text('Blurred bar')),
            ElevatedButton(
                onPressed: () => showGradient(context),
                child: Text('dismiss bar')),
          ],
        ),
      ),
    );
  }

  static showTop(BuildContext context) {
    Flushbar flush;

    try {
      flush = Flushbar(
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
        duration: Duration(seconds: 100),
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
      )..show(context);
      return flush;
    } on Exception catch (e) {
      // TODO
    }
  }

  showBlurr(BuildContext context) {
    Flushbar flush;

    try {
      flush = Flushbar(
        icon: Icon(Icons.error, size: 32, color: Colors.white),
        shouldIconPulse: false,
        title: 'title',
        message: 'hello',
        mainButton: FlatButton(
            onPressed: () {
              //  .dismiss(true);
              Navigator.pop(context);
            },
            child: Text(
              'Click Me',
              style: TextStyle(color: Colors.white, fontSize: 16),
            )),
        onTap: ((flushbar) {
          print('clicked bar');
        }),
        duration: Duration(seconds: 100),
        flushbarPosition: FlushbarPosition.TOP,
        margin: EdgeInsets.fromLTRB(8, kToolbarHeight + 8, 8, 0),
        borderRadius: 16,
        barBlur: 20,
        backgroundColor: Colors.black.withOpacity(0.5),
      )..show(context);
      return flush;
    } on Exception catch (e) {
      // TODO
    }
  }

  showDismiss(BuildContext context) => show(
        context,
        Flushbar(
          icon: Icon(Icons.error, size: 32, color: Colors.white),
          shouldIconPulse: false,
          title: 'title',
          message: 'hello',
          mainButton: FlatButton(
              onPressed: () {
                //  .dismiss(true);
                Navigator.pop(context);
              },
              child: Text(
                'Click Me',
                style: TextStyle(color: Colors.white, fontSize: 16),
              )),
          onTap: ((flushbar) {
            print('clicked bar');
          }),
          duration: Duration(seconds: 1),
          flushbarPosition: FlushbarPosition.TOP,
          margin: EdgeInsets.fromLTRB(8, kToolbarHeight + 8, 8, 0),
          borderRadius: 16,
          dismissDirection: FlushbarDismissDirection.HORIZONTAL,
          backgroundColor: Colors.blue.withOpacity(0.7),
          padding: EdgeInsets.all(24),
          animationDuration: Duration(microseconds: 0),
          barBlur: 20,
        ),
      );

  showGradient(BuildContext context) {
    Flushbar flush;

    try {
      flush = Flushbar(
        icon: Icon(Icons.error, size: 32, color: Colors.white),
        shouldIconPulse: false,
        title: 'title',
        message: 'hello',
        mainButton: FlatButton(
            onPressed: () {
              //  .dismiss(true);
              Navigator.pop(context);
            },
            child: Text(
              'Click Me',
              style: TextStyle(color: Colors.white, fontSize: 16),
            )),
        onTap: ((flushbar) {
          print('clicked bar');
        }),
        duration: Duration(seconds: 100),
        flushbarPosition: FlushbarPosition.TOP,
        margin: EdgeInsets.fromLTRB(8, kToolbarHeight + 8, 8, 0),
        borderRadius: 16,
        boxShadows: [
          BoxShadow(color: Colors.red, offset: Offset(2, 2), blurRadius: 32)
        ],
        backgroundGradient: LinearGradient(colors: [Colors.red, Colors.orange]),
      )..show(context);
      return flush;
    } on Exception catch (e) {
      // TODO
    }
  }

  Future show(BuildContext context, Flushbar newFlushBar) async {
    await Future.wait(flushBars.map((flushBar) => flushBar.dismiss()).toList());
    flushBars.clear();

    newFlushBar.show(context);
    flushBars.add(newFlushBar);
  }
}
