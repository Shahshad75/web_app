part of 'api_bloc.dart';

abstract class ApiEvent {}

class PendingDriverFetchEvent extends ApiEvent {}

class ApproveDriverFetchEvent extends ApiEvent {}

class ApprovingDriverEvent extends ApiEvent {
  DriverInfo driver;
  ApprovingDriverEvent({required this.driver});
}

class RejectedFetchDriverEvent extends ApiEvent {}

class RejectingDriverEvent extends ApiEvent {
  DriverInfo driver;
  RejectingDriverEvent({required this.driver});
}
