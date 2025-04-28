part of "login_bloc.dart";

@immutable
sealed class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {
  final String message;
  LoginSuccess({required this.message});
}

class LoginFailure extends LoginState {
  final String message;
  LoginFailure({required this.message});
}

class LoginLoading extends LoginState {}
