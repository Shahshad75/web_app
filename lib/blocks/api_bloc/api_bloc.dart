import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:web_app/service/apicalling.dart';

import '../../models/driver_model.dart';
part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  ApiBloc() : super(ApiInitial()) {
    on<PendingDriverFetchEvent>(driverFetchEvent);
    on<ApprovingDriverEvent>(approvingDriverEvent);
    on<ApproveDriverFetchEvent>(approveDriverFetchEvent);
    on<RejectedFetchDriverEvent>(rejectedFetchDriverEvent);
    on<RejectingDriverEvent>(rejectingDriverEvent);
  }

  FutureOr<void> driverFetchEvent(
      PendingDriverFetchEvent event, Emitter<ApiState> emit) async {
    emit(LoadingFetchState());
    await Future.delayed(const Duration(seconds: 1));
    List<DriverInfo>? drivers = await Apicalling.getAllPendingDrivers();

    if (drivers == null) {
      emit(FetchErrorState());
    } else if (drivers.isEmpty) {
      emit(EmptyDriverState());
    } else {
      emit(FetchSucessState(drivers: drivers));
    }
  }

  FutureOr<void> approvingDriverEvent(
      ApprovingDriverEvent event, Emitter<ApiState> emit) {
    Apicalling.approved(event.driver.id, event.driver);
  }

  FutureOr<void> approveDriverFetchEvent(
      ApproveDriverFetchEvent event, Emitter<ApiState> emit) async {
    emit(LoadingFetchState());
    await Future.delayed(const Duration(seconds: 1));
    List<DriverInfo>? drivers = await Apicalling.getAllApprovedDrivers();

    if (drivers == null) {
      emit(FetchErrorState());
    } else if (drivers.isEmpty) {
      emit(EmptyDriverState());
    } else {
      emit(FetchApprovedSucessState(drivers: drivers));
    }
  }

  FutureOr<void> rejectedFetchDriverEvent(
      RejectedFetchDriverEvent event, Emitter<ApiState> emit) async {
    emit(LoadingFetchState());
    await Future.delayed(const Duration(seconds: 1));
    List<DriverInfo>? drivers = await Apicalling.getAllRejectedDrivers();

    if (drivers == null) {
      emit(FetchErrorState());
    } else if (drivers.isEmpty) {
      emit(EmptyDriverState());
    } else {
      emit(FetchRejectedSucessState(drivers: drivers));
    }
  }

  FutureOr<void> rejectingDriverEvent(
      RejectingDriverEvent event, Emitter<ApiState> emit) {
    Apicalling.rejected(event.driver.id, event.driver);
  }
}
