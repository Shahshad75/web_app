import 'dart:async';
import 'package:bloc/bloc.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<CouponAddNavigateEvent>(couponAddNavigateEvent);
    on<OngoingScreenNavigateEvent>(ongoingScreenNavigateEvent);
    on<PendingEvent>(pendingEvent);
    on<ApprovedEvent>(approvedEvent);
    on<RejectEvent>(rejectEvent);
    on<DetailScreenNavigate>(detailScreenNavigate);
  }

  FutureOr<void> couponAddNavigateEvent(
      CouponAddNavigateEvent event, Emitter<HomeState> emit) {
    emit(CouponAddNavigateState());
  }

  FutureOr<void> ongoingScreenNavigateEvent(
      OngoingScreenNavigateEvent event, Emitter<HomeState> emit) {
    emit(OngoinNavigateState());
  }

  FutureOr<void> pendingEvent(PendingEvent event, Emitter<HomeState> emit) {
    emit(PendingTabState());
  }

  FutureOr<void> approvedEvent(ApprovedEvent event, Emitter<HomeState> emit) {
    emit(ApproveTabState());
  }

  FutureOr<void> rejectEvent(RejectEvent event, Emitter<HomeState> emit) {
    emit(RejectTabState());
  }

  FutureOr<void> detailScreenNavigate(
      DetailScreenNavigate event, Emitter<HomeState> emit) {
    emit(DetailNavigateState());
  }
}
