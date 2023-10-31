part of 'api_bloc.dart';

abstract class ApiState {}

final class ApiInitial extends ApiState {}

final class LoadingFetchState extends ApiState {}

final class FetchSucessState extends ApiState {
  List<DriverInfo> drivers = [];
  FetchSucessState({required this.drivers});
}

final class EmptyDriverState extends ApiState {}

final class FetchErrorState extends ApiState {}
