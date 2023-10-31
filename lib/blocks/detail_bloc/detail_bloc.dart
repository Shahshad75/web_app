import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(DetailInitial()) {
    on<ImageHoveEvent1>(imageHoveEvent);
    on<ImageHoveEvent2>(imageHoveEvent2);
    on<ImageHoveEvent3>(imageHoveEvent3);
    on<ImageHoveEvent4>(imageHoveEvent4);
  }

  FutureOr<void> imageHoveEvent(
      ImageHoveEvent1 event, Emitter<DetailState> emit) {
    if (event.isHover && event.image.isNotEmpty) {
      emit(IsHoverState1(url: event.image));
    } else {
      emit(IsHoverFalseState());
    }
  }

  FutureOr<void> imageHoveEvent2(
      ImageHoveEvent2 event, Emitter<DetailState> emit) {
    if (event.isHover && event.image.isNotEmpty) {
      emit(IsHoverState2(url: event.image));
    } else {
      emit(IsHoverFalseState());
    }
  }

  FutureOr<void> imageHoveEvent3(
      ImageHoveEvent3 event, Emitter<DetailState> emit) {
    if (event.isHover && event.image.isNotEmpty) {
      emit(IsHoverState3(url: event.image));
    } else {
      emit(IsHoverFalseState());
    }
  }

  FutureOr<void> imageHoveEvent4(
      ImageHoveEvent4 event, Emitter<DetailState> emit) {
    if (event.isHover && event.image.isNotEmpty) {
      emit(IsHoverState4(url: event.image));
    } else {
      emit(IsHoverFalseState());
    }
  }
}
