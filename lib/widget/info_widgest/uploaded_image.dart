import 'package:flutter/material.dart';

class UploadedImage extends StatelessWidget {
  const UploadedImage(
      {super.key, required this.text, required this.onDoubleTap, this.onHover});
  final String text;
  final void Function()? onDoubleTap;
  final void Function(bool)? onHover;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: onHover,
      onDoubleTap: onDoubleTap,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 209, 209, 209)),
            color: const Color.fromARGB(255, 237, 237, 237),
            borderRadius: BorderRadius.circular(10)),
        width: 150,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.image_outlined,
              color: Color.fromARGB(255, 154, 154, 154),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              text,
              style: const TextStyle(color: Color.fromARGB(255, 117, 117, 117)),
            ),
          ],
        ),
      ),
    );
  }
}
