import 'package:meta/meta.dart';

class LocaleState {
  final String locale;
  final bool hasChanged;

  const LocaleState({
    @required this.locale,
    @required this.hasChanged,
  });

  factory LocaleState.initial() {
    return LocaleState(
      locale: "en",
      hasChanged: false,
    );
  }

  factory LocaleState.loading(String locale) {
    return LocaleState(
      locale: locale,
      hasChanged: true,
    );
  }

  @override
  String toString() {
    return 'LocaleState{locale: $locale, hasChanged: $hasChanged}';
  }


}
