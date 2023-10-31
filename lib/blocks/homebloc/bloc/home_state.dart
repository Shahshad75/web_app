part of 'home_bloc.dart';

abstract class HomeState {}

final class HomeInitial extends HomeState {}

final class CouponAddNavigateState extends HomeState {}

final class OngoinNavigateState extends HomeState {}

final class PendingTabState extends HomeState {}

final class ApproveTabState extends HomeState {}

final class RejectTabState extends HomeState {}

final class DetailNavigateState extends HomeState {
  DriverInfo driver;
  DetailNavigateState({required this.driver});
}

final class ApprovedNavigateState extends HomeState {
  DriverInfo driver;
  ApprovedNavigateState({required this.driver});
}

final class RejectNavigateState extends HomeState {
  DriverInfo driver;
  RejectNavigateState({required this.driver});
}
