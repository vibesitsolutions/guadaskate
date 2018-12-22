import 'package:flutter/material.dart';

class MainTheme {
  static ThemeData getMainTheme() {
    return ThemeData(
        primaryColor: getMainColor(),
        accentColor: Colors.white,
        textTheme: TextTheme(
            headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            title: TextStyle(fontSize: 36.0),
            body1: TextStyle(fontSize: 14.0)));
  }

  static Color getMainColor() {
    return Colors.teal;
  }

  static TextStyle textStyle() {
    return TextStyle(
        color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold);
  }

  static TextStyle navMenuTextStyle() {
    return TextStyle(
        color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.normal);
  }
}
