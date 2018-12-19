import 'dart:async';

import 'package:flutter/material.dart';
import 'package:guadaskate/src/theme/main_theme.dart';
import 'package:guadaskate/src/ui/home_page.dart';

Future<void> main() async {
  return runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies',
      theme: MainTheme.getMainTheme(),
      home: HomePage(),
    );
  }
}
