import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:web_app/service/apicalling.dart';
import 'package:web_app/service/sharedpref.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginButtonEvent>(loginButtonEvent);
  }

  FutureOr<void> loginButtonEvent(
      LoginButtonEvent event, Emitter<AuthState> emit) async {
    final logged = await Apicalling.adminlogin(event.username, event.password);

    if (logged != null) {
    
      await Sharedpref.instence.setAuthDetaials(logged);
      final String? token = Sharedpref.instence.getAuthDetails();
      emit(LoggedSucessfullyState(token: token));
    } else if (logged == 400) {
      final String? token = Sharedpref.instence.getAuthDetails();
      emit(LoggedFaildState(token: token));
    }
  }
}
