import 'package:flutter/widgets.dart';

abstract class LanguageEvent {}

class LanguageChanged extends LanguageEvent {
  final String lang;

  LanguageChanged({@required this.lang});
}
