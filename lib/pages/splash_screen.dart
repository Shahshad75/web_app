import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_app/blocks/auth_bloc/auth_bloc.dart';

import '../service/apicalling.dart';
import '../service/sharedpref.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    validatorDriver(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.yellow,
          width: 200,
          height: 200,
        ),
      ),
    );
  }

  void validatorDriver(BuildContext context) async {
    final driverAuth = Sharedpref.instence.getAuthDetails();

    if (driverAuth != null) {
      final data = await Apicalling.adminlogin('Shahshad@7558', 'Shah1234');

      if (data != null) {
        Beamer.of(context).beamToNamed(
          '/home',
        );
      } else {
        Beamer.of(context).beamToNamed(
          '/login',
        );
      }
    } else {
      await Future.delayed(const Duration(seconds: 2));
      Beamer.of(context).beamToNamed(
        '/login',
      );
    }
  }
}
