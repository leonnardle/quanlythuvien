
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../rest/login_function.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      try {
        final response = await userLogin(event.email.trim(),event.password.trim());
        if (response['success']) {
          yield LoginSuccess('login success');
        } else {
          print(response);
          yield LoginFailure(error: 'login failed, status code: ${response.statusCode}');
        }
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}