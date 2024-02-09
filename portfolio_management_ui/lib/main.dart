import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_management_ui/Pages/BasePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoSerif',
            color: Colors.black,
          ),
          displayMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoSerif',
            color: Colors.black,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            fontFamily: 'RobotoSerif',
            color: Colors.black,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            fontFamily: 'RobotoSerif',
            color: Colors.black,
          ),
          titleLarge: TextStyle(
            fontSize: 14,
            fontFamily: 'RobotoSerif',
            color: Colors.black,
          ),
          titleMedium: TextStyle(
            fontSize: 14,
            fontFamily: 'RobotoSerif',
            color: Colors.black,
          ),
          headlineMedium: TextStyle(
            fontSize: 14,
            fontFamily: 'RobotoSerif',
            color: Colors.black,
          ),
          headlineLarge: TextStyle(
            fontSize: 14,
            fontFamily: 'RobotoSerif',
            color: Colors.black,
          ),
          labelLarge: TextStyle(
            fontSize: 14,
            fontFamily: 'RobotoSerif',
            color: Colors.black,
          ),
          labelMedium: TextStyle(
            fontSize: 14,
            fontFamily: 'RobotoSerif',
            color: Colors.black,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: BasePage(),
    );
  }
}
