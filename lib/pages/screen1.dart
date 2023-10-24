import 'package:flutter/material.dart';
import 'package:web_app/widget/navbars/menu_navubar.dart';
import 'package:web_app/widget/navbars/navbar.dart';
import 'package:web_app/widget/sidebar.dart/sidebar.dart';
import 'package:web_app/widget/tabbar/tabbar_widget.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //menu bar

          const Expanded(
              flex: 1,
              child: SizedBox(
                child: Column(
                  children: [
                    MenuNav(),
                    SideBar(),
                  ],
                ),
              )),

          //body part

          Expanded(
              flex: 5,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        left: BorderSide(
                            color: Color.fromARGB(255, 255, 182, 11)))),
                child: const Column(
                  children: [
                    Navbar(),
                    Expanded(
                      child: TabBars(),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
