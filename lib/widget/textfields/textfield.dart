import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    required this.text,
    this.controller,
    required this.keyboardType,
    required this.readOnly,
    this.suffixIcon,
    this.hintext,
  });
  final Widget? suffixIcon;
  final String text;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool readOnly;
  final String? hintext;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(
                color: Color.fromARGB(255, 111, 111, 111),
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            readOnly: readOnly,
            keyboardType: keyboardType,
            controller: controller,
            decoration: InputDecoration(
              hintText: hintext,
              suffixIcon: suffixIcon,
              border: const OutlineInputBorder(),
            ),
          )
        ],
      ),
    );
  }
}
