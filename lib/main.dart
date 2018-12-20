import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guadaskate/src/blocs/pages/pages_posts_bloc.dart';
import 'package:guadaskate/src/theme/main_theme.dart';
import 'package:guadaskate/src/ui/home_page.dart';

void main() {
  BlocSupervisor().delegate = SimpleBlocDelegate();
  runApp(App());
}

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Transition transition) {
    print(transition.toString());
  }
}

class App extends StatefulWidget {
  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  final PagesPostBloc _pagesPostBloc = PagesPostBloc();

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
        title: 'Movies',
        theme: MainTheme.getMainTheme(),
        home: HomePage(),
      ),
    );
  }
}
