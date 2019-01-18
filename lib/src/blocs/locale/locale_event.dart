import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

abstract class LocaleEvent {}

class LocaleChange extends LocaleEvent {
  final String oldLocale;
  final String newLocale;
  final bool hasLangChanged;

  LocaleChange({
    @required this.oldLocale,
    @required this.newLocale,
  }) : hasLangChanged = oldLocale != newLocale;

}

class LocaleChanged extends LocaleEvent {}
