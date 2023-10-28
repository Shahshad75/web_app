part of 'coupon_bloc.dart';

abstract class CouponEvent {}

final class StartDatePicEvent extends CouponEvent {
  BuildContext context;
  StartDatePicEvent({required this.context});
}

final class EndDatePicEvent extends CouponEvent {
    BuildContext context;
  EndDatePicEvent({required this.context});
}
