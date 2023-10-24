import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_app/pages/screen1.dart';

bool isSelected = false;
void main(List<String> args) {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Homescreen(),
      theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme.call()),
      debugShowCheckedModeBanner: false,
    );
  }
}
