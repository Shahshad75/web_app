import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_app/blocks/auth_bloc/auth_bloc.dart';
import 'package:web_app/pages/home_screen.dart';

import 'athentiction_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<AuthBloc, AuthState>(
      listenWhen: (previous, current) => current is AuthActionableState,
      buildWhen: (previous, current) => current is! AuthActionableState,
      listener: (context, state) {
        if (state is LoggedSucessfullyState) {
          return Beamer.of(context).beamToNamed('/login');
        } else if (state is LoggedFaildState) {
          return Beamer.of(context).beamToNamed('/');
        }
      },
      builder: (context, state) {
        if (state is LoggedSucessfullyState) {
          return const Homescreen();
        } else if (state is LoggedFaildState) {
          return const AthenticationScreen();
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    ));
  }
}
