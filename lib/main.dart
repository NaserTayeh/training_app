// @dart=2.9
import 'package:diet_trainingapp/provider/diet_app_provider.dart';
import 'package:diet_trainingapp/view/screen/add_new_item_screen.dart';
import 'package:diet_trainingapp/view/screen/notification_screen.dart';
import 'package:diet_trainingapp/view/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:diet_trainingapp/view/screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import 'data_repository/db_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  await DbHelper.dbHelper.initDatabase();

  runApp(EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DietProvider>(
        create: (context) {
          return DietProvider();
        },
        child: AppInit());
  }
}

class AppInit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: Provider.of<DietProvider>(context).isDarkMode
            ? ThemeData.dark()
            : ThemeData.light(),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: SplashScreen()
        // MyHome()
        // ProfileScreen(),

        // AddNewItem()
        //  FlashScreen()
        // ProfileScreen(),
        );
  }
}
