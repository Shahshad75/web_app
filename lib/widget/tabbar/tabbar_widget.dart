import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:web_app/blocks/detail_bloc/detail_bloc.dart';
import 'package:web_app/blocks/homebloc/bloc/home_bloc.dart';
import 'package:web_app/widget/info_widgest/document_hoverimage.dart';
import 'package:web_app/widget/tabbar/pending_req.dart';
import 'package:web_app/widget/tabbar/rejected_drivers.dart';

import 'approved_drivers.dart';

class TabBars extends StatelessWidget {
  const TabBars({super.key});

  @override
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
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return DefaultTabController(
                  initialIndex: 0,
                  length: 3,
                  child: Stack(
                    children: [
                      Column(
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

                      //Hovering image bloc//

                      BlocBuilder<DetailBloc, DetailState>(
                        builder: (context, state) {
                          if (state is IsHoverState1) {
                            return const HoverImage(
                                alignment: Alignment.centerRight);
                          } else if (state is IsHoverState2) {
                            return const HoverImage(
                                alignment: Alignment.centerLeft);
                          } else if (state is IsHoverState3) {
                            return const HoverImage(
                                alignment: Alignment.centerRight);
                          } else if (state is IsHoverState4) {
                            return const HoverImage(
                                alignment: Alignment.centerLeft);
                          } else if (state is IsHoverFalseState) {
                            return const SizedBox();
                          }
                          return Container();
                        },
                      )
                    ],
                  ),
                );
              },
            )));
  }
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
