import 'package:flutter/material.dart';

class MainTheme {
  static ThemeData getMainTheme() {
    return ThemeData(
        primaryColor: Colors.pink,
        accentColor: Colors.white,
        textTheme: TextTheme(
            headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            title: TextStyle(fontSize: 36.0),
            body1: TextStyle(fontSize: 14.0)));
  }
}
