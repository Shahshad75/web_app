import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_app/blocks/api_bloc/api_bloc.dart';
import 'package:web_app/blocks/auth_bloc/auth_bloc.dart';
import 'package:web_app/blocks/coupon_bloc/bloc/coupon_bloc.dart';
import 'package:web_app/blocks/detail_bloc/detail_bloc.dart';
import 'package:web_app/blocks/homebloc/bloc/home_bloc.dart';
import 'package:web_app/pages/athentiction_screen.dart';
import 'package:beamer/beamer.dart';
import 'package:web_app/pages/home_screen.dart';
import 'package:web_app/pages/image_screen.dart';
import 'package:web_app/pages/splash_screen.dart';
import 'package:web_app/service/sharedpref.dart';

void main(List<String> args) async {
  await Sharedpref.instence.initeStorage();

  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  Myapp({super.key});
  final routerDelegate = BeamerDelegate(
      locationBuilder: RoutesLocationBuilder(routes: {
    '/': (context, state, data) => const SplashScreen(),
    '/home': (context, state, data) => const Homescreen(),
    '/login': (context, state, data) => const AthenticationScreen(),
    '/document_image': (context, state, data) => const ImageScreen(),
  }));
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DetailBloc()),
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => CouponBloc()),
        BlocProvider(create: (context) => ApiBloc()),
        BlocProvider(create: (context) => AuthBloc())
      ],
      child: MaterialApp.router(
        routeInformationParser: BeamerParser(),
        routerDelegate: routerDelegate,
        theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme.call()),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
