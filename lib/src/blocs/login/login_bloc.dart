import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:guadaskate/src/blocs/login/login_event.dart';
import 'package:guadaskate/src/blocs/login/login_state.dart';
import 'package:meta/meta.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginState get initialState => LoginState.initial();

  void onLoginButtonPressed({String username, String password}) {
    dispatch(
      LoginButtonPressed(
        username: username,
        password: password,
      ),
    );
  }

  void onLoginSuccess() {
    dispatch(LoggedIn());
  }

  @override
  Stream<LoginState> mapEventToState(
    LoginState state,
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      yield LoginState.loading();

      try {
        final token = await _getToken(
          username: event.username,
          password: event.password,
        );

        yield LoginState.success(token);
      } catch (error) {
        yield LoginState.failure(error.toString());
      }
    }

    if (event is LoggedIn) {
      yield LoginState.initial();
    }
  }

  Future<String> _getToken({
    @required String username,
    @required String password,
  }) async {
    await Future.delayed(Duration(seconds: 1));

    /// uncomment the following line to simulator a login error.
    // throw Exception('Login Error');
    return 'token';
  }
}
