import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:guadaskate/src/blocs/locale/locale_bloc.dart';
import 'package:guadaskate/src/blocs/locale/locale_event.dart';
import 'package:guadaskate/src/blocs/locale/locale_state.dart';
import 'package:guadaskate/src/config/globals.dart';
import 'package:guadaskate/src/lang/lang_localizations.dart';
import 'package:guadaskate/src/theme/main_theme.dart';
import 'package:guadaskate/src/ui/home_page.dart';

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
  final LocaleBloc _localeBloc = LocaleBloc();

  @override
  void dispose() {
    _localeBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocaleBloc>(
      bloc: _localeBloc,
      child: BlocBuilder<LocaleEvent, LocaleState>(
        bloc: _localeBloc,
        builder: (context, state) {
          return MaterialApp(
            locale: Locale(_localeBloc.currentState.locale),
            localizationsDelegates: [
              const LangLocalizationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: global.supportedLocales.map((f) => Locale(f)),
            theme: MainTheme.getMainTheme(),
            home: HomePage(),
          );
        },
      ),
    );
  }
}
