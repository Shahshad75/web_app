import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_app/blocks/api_bloc/api_bloc.dart';
import 'package:web_app/blocks/coupon_bloc/bloc/coupon_bloc.dart';
import 'package:web_app/blocks/detail_bloc/detail_bloc.dart';
import 'package:web_app/blocks/homebloc/bloc/home_bloc.dart';
import 'package:web_app/pages/athentiction_screen.dart';

bool isSelected = false;
void main(List<String> args) async {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DetailBloc()),
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => CouponBloc()),
        BlocProvider(
          create: (context) => ApiBloc(),
          child: Container(),
        )
      ],
      child: MaterialApp(
        home: const AthenticationScreen(),
        theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme.call()),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
