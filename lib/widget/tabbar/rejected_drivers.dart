import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class RejectedDrivers extends StatelessWidget {
  const RejectedDrivers({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (BuildContext context) => cons(),
    );
  }

  Widget cons() {
    return Container(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, right: 30),
        child: Container(
          width: double.maxFinite,
          height: 600,
          decoration: BoxDecoration(border: Border.all(color: Colors.amber)),
          child: const Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
