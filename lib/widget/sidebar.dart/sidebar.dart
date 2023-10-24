import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'expandtile.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (BuildContext context) => sidebar(),
    );
  }

  Widget sidebar() {
    return Column(
      children: [
        adminProfile(),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ExpansionTile(
            initiallyExpanded: true,
            textColor: Colors.black,
            collapsedTextColor: Colors.black,
            title: Text(
              'Driver Details',
              style: GoogleFonts.poppins(
                  fontSize: 19, fontWeight: FontWeight.w500),
            ),
            children: [
              ExpandTile(
                title: "Pending Request",
                onTap: () {},
              ),
              ExpandTile(
                title: "Approved Drivers",
                onTap: () {},
              ),
              ExpandTile(
                title: "Rejected Drivers",
                onTap: () {},
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ExpansionTile(
            textColor: Colors.black,
            collapsedTextColor: Colors.black,
            title: Text(
              'Revenue Side',
              style: GoogleFonts.poppins(
                  fontSize: 19, fontWeight: FontWeight.w500),
            ),
            children: [
              ExpandTile(
                title: "Total Details",
                onTap: () {},
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
            width: 150,
            height: 40,
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.amber),
                ),
                onPressed: () {},
                child: const Text('LogOut')))
      ],
    );
  }

  Widget adminProfile() {
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.amber, width: 0.5))),
      width: double.maxFinite,
      height: 200,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 45,
            backgroundImage: AssetImage("images/admin.jpg"),
          ),
          SizedBox(
            height: 15,
          ),
          Text("Shahshad babu"),
        ],
      ),
    );
  }
}
