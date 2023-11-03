import 'package:flutter/material.dart';
import 'package:web_app/widget/authenticate.dart/authenticat_screen.dart';

class AthenticationScreen extends StatelessWidget {
  const AthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [AthentictionTab()],
    )));
  }
}
