import 'dart:async';

import 'package:guadaskate/src/config/globals.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'package:guadaskate/l10n/messages_all.dart';

// We have to build this file before we uncomment the next import line,
// and we'll get to that shortly
// import '../../l10n/messages_all.dart';

class LangLocalizations {
  static Future<LangLocalizations> load(Locale locale) {
    final String name =
    locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new LangLocalizations();
    });
  }

  static LangLocalizations of(BuildContext context) {
    return Localizations.of<LangLocalizations>(context, LangLocalizations);
  }

  String get title => Intl.message("Test translation", name: "title", desc: "App title");

  String get languageSelector => Intl.message("Test Select language", name: "languageSelector", desc:" Language Selector");

  String messageCount(int howMany) => Intl.plural(howMany,
      zero: 'No messages',
      one: '$howMany message',
      other: '$howMany messages',
      args: [howMany],
      name: 'messageCount',
      desc: 'Message counter'
    );

  String get body => Intl.message("Test This is a test", name: "body", desc: "Main body text");
}

class LangLocalizationsDelegate extends LocalizationsDelegate<LangLocalizations> {
  final Locale newLocale;

  const LangLocalizationsDelegate({this.newLocale});

  @override
  bool isSupported(Locale locale) => global.supportedLocales.contains(locale.languageCode);

  @override
  Future<LangLocalizations> load(Locale locale) => LangLocalizations.load(newLocale ?? locale);

  @override
  bool shouldReload(LocalizationsDelegate<LangLocalizations> old) => false;
}