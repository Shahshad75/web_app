import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:web_app/service/apicalling.dart';

import '../../models/driver_model.dart';
part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  ApiBloc() : super(ApiInitial()) {
    on<DriverFetchEvent>(driverFetchEvent);
  }

  FutureOr<void> driverFetchEvent(
      DriverFetchEvent event, Emitter<ApiState> emit) async {
    emit(LoadingFetchState());
    await Future.delayed(const Duration(seconds: 1));
    List<DriverInfo> drivers = await Apicalling.getAllDrivers();
    if (drivers.isNotEmpty) {
      emit(FetchSucessState(drivers: drivers));
    } else {
      emit(EmptyDriverState());
    }
  }
}
