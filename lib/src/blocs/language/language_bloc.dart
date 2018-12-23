import 'package:bloc/bloc.dart';
import 'package:guadaskate/src/blocs/language/language_event.dart';
import 'package:guadaskate/src/blocs/language/language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  @override
  LanguageState get initialState => LanguageState.isLoaded();

  @override
  Stream<LanguageState> mapEventToState(
      currentState, LanguageEvent event) async* {
    if (event is LanguageChanged) {
      yield LanguageState.isLoading();

      yield LanguageState.isLoaded();
    }
  }
}
