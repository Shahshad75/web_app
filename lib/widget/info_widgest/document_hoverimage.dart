import 'package:flutter/material.dart';

class HoverImage extends StatelessWidget {
  const HoverImage({super.key, required this.alignment});
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: AnimatedContainer(
        duration: const Duration(seconds: 2),
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('images/admin.jpg'))),
        width: 500,
        height: 500,
      ),
    );
  }
}
