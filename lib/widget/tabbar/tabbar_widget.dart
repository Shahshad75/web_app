import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:web_app/widget/tabbar/pending_req.dart';
import 'package:web_app/widget/tabbar/rejected_drivers.dart';

import 'approved_drivers.dart';

class TabBars extends StatelessWidget {
  const TabBars({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (BuildContext context) => page(context),
    );
  }

  Widget page(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 30, top: 30),
      child: SizedBox(
        width: double.infinity,
        height: screenHeight,
        child: DefaultTabController(
          length: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headtext(),
              tabbar(),
              const Expanded(
                child: TabBarView(
                  children: [
                    Center(child: PendingReq()),
                    Center(child: ApprovedDrivers()),
                    Center(child: RejectedDrivers()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget tabbar() {
    return const TabBar(
        labelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
        indicator: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.amber, width: 3))),
        isScrollable: true,
        labelPadding: EdgeInsets.symmetric(horizontal: 10.0),
        labelColor: Colors.black,
        tabs: [
          Tab(text: 'Pending Requests'),
          Tab(text: 'Approved Drivers'),
          Tab(text: 'Rejected Drivers'),
        ]);
  }

  Widget headtext() {
    return const SizedBox(
      child: Padding(
        padding: EdgeInsets.only(bottom: 10.0, left: 10),
        child: Text(
          'All Drivers Details',
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 20, color: Colors.grey),
        ),
      ),
    );
  }
}
