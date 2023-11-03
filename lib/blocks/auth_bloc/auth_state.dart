part of 'auth_bloc.dart';

abstract class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthActionableState extends AuthState {}

final class LoggedSucessfullyState extends AuthState {}

final class LoggedFaildState extends AuthState {}
