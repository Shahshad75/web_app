part of 'auth_bloc.dart';

abstract class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthActionableState extends AuthState {}

final class LoggedSucessfullyState extends AuthState {
  final  token;
  LoggedSucessfullyState({required this.token});
}

final class LoggedFaildState extends AuthState {
  final  token;
  LoggedFaildState({required this.token});
}
