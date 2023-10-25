import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (BuildContext context) => imageContaier(),
    );
  }

  Widget imageContaier() {
    return Center(
      child: Container(
        width: 600,
        height: 600,
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('images/admin.jpg'))),
      ),
    );
  }
}
