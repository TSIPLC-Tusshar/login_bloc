import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';
part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());
      try {
        await Future.delayed(Duration(seconds: 3));
        if (event.email == "test@gmail.com" && event.password == "12345") {
          return emit(LoginSuccess(message: "Login Success"));
        } else {
          return emit(LoginFailure(message: "Invalid credentials !"));
        }
      } catch (e) {
        return emit(LoginFailure(message: e.toString()));
      }
    });
  }
}
