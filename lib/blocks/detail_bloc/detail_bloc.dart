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
    if (event.isHover && event.image == Imagenumber.image1) {
      emit(IsHoverState1());
    } else {
      emit(IsHoverFalseState());
    }
  }

  FutureOr<void> imageHoveEvent2(
      ImageHoveEvent2 event, Emitter<DetailState> emit) {
    if (event.isHover && event.image == Imagenumber.image2) {
      emit(IsHoverState2());
    } else {
      emit(IsHoverFalseState());
    }
  }

  FutureOr<void> imageHoveEvent3(
      ImageHoveEvent3 event, Emitter<DetailState> emit) {
    if (event.isHover && event.image == Imagenumber.image3) {
      emit(IsHoverState3());
    } else {
      emit(IsHoverFalseState());
    }
  }

  FutureOr<void> imageHoveEvent4(
      ImageHoveEvent4 event, Emitter<DetailState> emit) {
    if (event.isHover && event.image == Imagenumber.image4) {
      emit(IsHoverState4());
    } else {
      emit(IsHoverFalseState());
    }
  }
}
