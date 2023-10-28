part of 'coupon_bloc.dart';

abstract class CouponState {}

final class CouponInitial extends CouponState {}

final class StartDateState extends CouponState {
  DateTime startdate;
  StartDateState({required this.startdate});
}

final class EndDateState extends CouponState {
  DateTime endDate;
  EndDateState({required this.endDate});
}
