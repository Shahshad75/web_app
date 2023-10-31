import 'package:flutter/material.dart';

class HoverImage extends StatelessWidget {
  const HoverImage({super.key, required this.alignment, required this.url});
  final AlignmentGeometry alignment;
  final String url;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: AnimatedContainer(
        duration: const Duration(seconds: 2),
        decoration:
            BoxDecoration(image: DecorationImage(image: NetworkImage(url))),
        width: 500,
        height: 500,
      ),
    );
  }
}
