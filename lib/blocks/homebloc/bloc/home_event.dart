part of 'home_bloc.dart';

abstract class HomeEvent {}

final class CouponAddNavigateEvent extends HomeEvent {}

final class OngoingScreenNavigateEvent extends HomeEvent {}

final class PendingEvent extends HomeEvent {}

final class ApprovedEvent extends HomeEvent {}

final class RejectEvent extends HomeEvent {}

final class DetailScreenNavigate extends HomeEvent {}
