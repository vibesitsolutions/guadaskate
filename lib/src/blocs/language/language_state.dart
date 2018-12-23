import 'package:meta/meta.dart';

class LanguageState {
  final bool isLoading;
  final bool isLoaded;

  LanguageState({@required this.isLoading, @required this.isLoaded});

  factory LanguageState.isLoading() {
    return LanguageState(
      isLoading: true,
      isLoaded: false,
    );
  }

  factory LanguageState.isLoaded() {
    return LanguageState(
      isLoading: false,
      isLoaded: true,
    );
  }

  @override
  String toString() {
    return 'LanguageState{isLoading: $isLoading, isLoaded: $isLoaded}';
  }
}
