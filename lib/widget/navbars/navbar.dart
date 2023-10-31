import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (BuildContext context) => desktopNavbar(),
    );
  }

  Widget desktopNavbar() {
    return SizedBox(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                textfield(),
              ],
            ),
          ),
          const Divider(
            height: 0,
          )
        ],
      ),
    );
  }

  Widget navButton(title) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: TextButton(onPressed: () {}, child: Text(title)),
    );
  }

  Widget textfield() {
    return Row(
      children: [
        SizedBox(
            width: 250,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 11.0),
              child: CupertinoTextField(
                placeholder: 'Search',
                placeholderStyle: const TextStyle(
                    color: Colors.amber, fontWeight: FontWeight.w500),
                decoration: BoxDecoration(
                    // color: Color.fromARGB(255, 246, 246, 246),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.amber)),
                onChanged: (text) {},
              ),
            )),
        const SizedBox(
          width: 20,
        ),
        navlogo()
      ],
    );
  }

  Widget navlogo() {
    return const SizedBox(
      child: CircleAvatar(
        backgroundImage: AssetImage('images/admin.jpg'),
      ),
    );
  }

  Widget navIcon() {
    return SizedBox(
      child: CircleAvatar(
          backgroundColor: Colors.amber,
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ))),
    );
  }
}
