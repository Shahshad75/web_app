import 'package:flutter/material.dart';

class InfoTexts extends StatelessWidget {
  const InfoTexts({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 104, 104, 104)),
      ),
    );
  }
}
