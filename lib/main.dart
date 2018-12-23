import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guadaskate/src/blocs/language/language_bloc.dart';
import 'package:guadaskate/src/blocs/pages/pages_posts_bloc.dart';
import 'package:guadaskate/src/config/globals.dart';
import 'package:guadaskate/src/theme/main_theme.dart';
import 'package:guadaskate/src/ui/page_page.dart';
import 'package:guadaskate/src/widget/drawer.dart';

void main() {
  BlocSupervisor().delegate = SimpleBlocDelegate();
  runApp(App());
}

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Transition transition) {
    print("Transition ${transition.toString()}");
  }
}

class App extends StatefulWidget {
  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  final PagesPostBloc _pagesPostBloc = PagesPostBloc();
  final LanguageBloc _languageBloc = LanguageBloc();
  String _locale;

  AppState() {
    _pagesPostBloc.onGetPage(Global.typePage, "sample-page");
    _locale = "es";
  }

  @override
  void dispose() {
    _pagesPostBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PagesPostBloc>(
      bloc: _pagesPostBloc,
      child: MaterialApp(
        title: 'Guadalajara Show',
        theme: MainTheme.getMainTheme(),
        home: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text('Guadalajara Show 2018'),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.language),
                  onPressed: () => _onLanguagePressed(context),
                  tooltip: "Idioma",
                ),
                IconButton(
                  icon: Icon(Icons.input),
                  onPressed: _onLoginPressed,
                  tooltip: "Iniciar sesion",
                ),
              ],
            ),
            drawer: MyDrawer(),
            body: PagePage(pagesPostBloc: _pagesPostBloc),
          ),
        ),
      ),
    );
  }

  void _onLanguagePressed(context) {}

  void _onLoginPressed() {}
}
