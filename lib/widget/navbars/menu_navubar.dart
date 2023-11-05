import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:web_app/utils/colors.dart';

class MenuNav extends StatelessWidget {
  const MenuNav({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (BuildContext context) => navbar(),
    );
  }

  Widget navbar() {
    return Container(
        color: AppColors.amberAccent,
        width: double.infinity,
        height: 62,
        child: Center(
          child: Container(
            width: double.infinity,
            height: 45,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        'images/driver-61-logo-transparent-1000x350.png'))),
          ),
        ));
  }
}
