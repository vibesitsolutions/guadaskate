import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:guadaskate/src/blocs/locale/locale_event.dart';
import 'package:guadaskate/src/blocs/locale/locale_state.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocaleState get initialState => LocaleState.initial();

  void onLocaleChange(String oldLocale, String newLocale) {
    dispatch(
      LocaleChange(
        newLocale: newLocale,
        oldLocale: oldLocale,
      ),
    );
  }

  void onLocaleSuccess() {
    dispatch(LocaleChanged());
  }

  @override
  Stream<LocaleState> mapEventToState(
    LocaleState state,
    LocaleEvent event,
  ) async* {
    if (event is LocaleChange) {
      if (event.hasLangChanged) {
        yield LocaleState.loading(event.newLocale);
      }
      else
        yield LocaleState.initial();
    }

    if (event is LocaleChanged) {
      yield LocaleState.initial();
    }
  }
}
