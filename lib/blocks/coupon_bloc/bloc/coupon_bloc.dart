import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'coupon_event.dart';
part 'coupon_state.dart';

class CouponBloc extends Bloc<CouponEvent, CouponState> {
  CouponBloc() : super(CouponInitial()) {
    on<StartDatePicEvent>(startDatePicEvent);
    on<EndDatePicEvent>(endDatePicEvent);
  }

  FutureOr<void> startDatePicEvent(
      StartDatePicEvent event, Emitter<CouponState> emit) async {
    DateTime selectedDate = DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: event.context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      emit(StartDateState(startdate: picked));
    }
  }

  FutureOr<void> endDatePicEvent(
      EndDatePicEvent event, Emitter<CouponState> emit) async {
    DateTime selectedDate = DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: event.context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      emit(EndDateState(endDate: picked));
    }
  }
}
