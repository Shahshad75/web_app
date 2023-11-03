part of 'auth_bloc.dart';

abstract class AuthEvent {}

class LoginButtonEvent extends AuthEvent {
  final String username;
  final String password;
  LoginButtonEvent({required this.username, required this.password});
}
