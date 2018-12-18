import 'dart:async';

import 'package:flutter/material.dart';
import 'package:guadaskate/src/blocs/bloc_provider.dart';
import 'package:guadaskate/src/blocs/post_bloc.dart';
import 'package:guadaskate/src/ui/home_page.dart';

Future<void> main() async {
  return runApp(
    BlocProvider<PostBloc>(
      bloc: PostBloc(),
      child: App()
    )
  );
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}