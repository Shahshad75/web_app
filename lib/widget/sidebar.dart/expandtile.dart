import 'package:flutter/material.dart';

class ExpandTile extends StatelessWidget {
  const ExpandTile({super.key, required this.title, required this.onTap});
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        hoverColor: const Color.fromARGB(97, 255, 213, 87),
        onTap: onTap,
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
        ),
      ),
    );
  }
}
