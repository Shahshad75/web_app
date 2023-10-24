import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ApprovedDrivers extends StatelessWidget {
  const ApprovedDrivers({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (BuildContext context) => cons(),
    );
  }

  Widget cons() {
    return Center(
      child: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(top: 0, right: 0),
          child: Container(
            width: double.maxFinite,
            height: 600,
            decoration: BoxDecoration(
                boxShadow: const [], border: Border.all(color: Colors.amber)),
            child: const Column(
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
