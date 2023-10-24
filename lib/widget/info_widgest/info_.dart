import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({
    super.key,
    required this.text,
    required this.informs1,
    this.informs2,
  });
  final Widget informs1;
  final String text;
  final Widget? informs2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 200,
            child: Text(
              text,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 83, 83, 83)),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          informs1,
          const SizedBox(
            width: 20,
          ),
          informs2!,
        ],
      ),
    );
  }
}
