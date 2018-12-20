import 'package:guadaskate/src/models/model_helper.dart';
import 'package:meta/meta.dart';

class PagesPostState {
  final bool isLoading;
  final bool isError;
  final bool isSuccess;

  final String error;
  final Model data;

  const PagesPostState({
    @required this.isLoading,
    @required this.isError,
    @required this.isSuccess,
    @required this.error,
    @required this.data,
  });

  factory PagesPostState.idle() {
    return PagesPostState(
      isLoading: false,
      isError: false,
      isSuccess: false,
      error: '',
      data: null,
    );
  }

  factory PagesPostState.loading() {
    return PagesPostState(
      isLoading: true,
      isError: false,
      isSuccess: false,
      error: '',
      data: null,
    );
  }

  factory PagesPostState.success(Model model) {
    return PagesPostState(
      isLoading: true,
      isError: false,
      isSuccess: true,
      error: '',
      data: model,
    );
  }

  factory PagesPostState.failure(String error) {
    return PagesPostState(
      isLoading: false,
      isError: true,
      isSuccess: false,
      error: error,
      data: null,
    );
  }

  @override
  String toString() {
    return 'PagesState{isLoading: $isLoading, error: $error, thereIsData: ${data != null ? true : false}';
  }
}
