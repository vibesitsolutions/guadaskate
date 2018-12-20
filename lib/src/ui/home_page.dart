import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:guadaskate/src/blocs/pages/pages_posts_bloc.dart';
import 'package:guadaskate/src/ui/page_page.dart';
import 'package:guadaskate/src/widget/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text('Guadalajara Show 2018'), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.language),
          onPressed: _onLanguagePressed,
          tooltip: "Idioma",
        ),
        IconButton(
            icon: Icon(Icons.input),
            onPressed: _onLoginPressed,
            tooltip: "Iniciar sesion")
      ]),
      drawer: MyDrawer(),
      body: Center(child: PagePage()),
    ));
  }

  void _onLanguagePressed() {}

  void _onLoginPressed() {}
}
