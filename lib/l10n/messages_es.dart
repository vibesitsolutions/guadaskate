// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
// messages from the main program should be duplicated here with the same
// function name.

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

// ignore: unnecessary_new
final messages = new MessageLookup();

// ignore: unused_element
final _keepAnalysisHappy = Intl.defaultLocale;

// ignore: non_constant_identifier_names
typedef MessageIfAbsent(String message_str, List args);

class MessageLookup extends MessageLookupByLibrary {
  get localeName => 'es';

  static m0(howMany) => "${Intl.plural(howMany, zero: 'Sin mensajes', one: '${howMany} mensaje', other: '${howMany} mensajes')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "body" : MessageLookupByLibrary.simpleMessage("Esto es una prueba de traduccion"),
    "languageSelector" : MessageLookupByLibrary.simpleMessage("Seleccion de idioma"),
    "messageCount" : m0,
    "title" : MessageLookupByLibrary.simpleMessage("Prueba de traduccion")
  };
}
