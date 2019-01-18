import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guadaskate/src/blocs/locale/locale_bloc.dart';
import 'package:guadaskate/src/config/globals.dart';
import 'package:guadaskate/src/lang/lang_localizations.dart';

class LanguageSelectorPage extends StatefulWidget {
  @override
  _LanguageSelectorPageState createState() => _LanguageSelectorPageState();
}

class _LanguageSelectorPageState extends State<LanguageSelectorPage> {

  @override
  Widget build(BuildContext context) {
    final LocaleBloc localeBloc = BlocProvider.of<LocaleBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(LangLocalizations.of(context).languageSelector),
      ),
      body: ListView.builder(
        itemCount: global.supportedLocales.length,
        itemBuilder: (context, index){
          return _buildLanguageItem(localeBloc, global.supportedLocales[index]);
        },
      ),
    );
  }

  _buildLanguageItem(LocaleBloc localeBloc, String language){
    String currentLocale = Localizations.localeOf(context).toString();
    return InkWell(
      onTap: () {
        localeBloc.onLocaleChange(currentLocale, language);
        print("LanguageSelectorPage - selected language $language");
        Navigator.pop(context);
      },
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            language,
            style: TextStyle(
              fontSize: 24.0,
            ),
          ),
        ),
      ),
    );
  }
}