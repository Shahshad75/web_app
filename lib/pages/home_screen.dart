import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_app/blocks/api_bloc/api_bloc.dart';
import 'package:web_app/blocks/homebloc/bloc/home_bloc.dart';
import 'package:web_app/pages/add_coupons_screen.dart';
import 'package:web_app/pages/on_going_coupons_page.dart';
import 'package:web_app/utils/colors.dart';
import 'package:web_app/widget/navbars/menu_navubar.dart';
import 'package:web_app/widget/navbars/navbar.dart';
import 'package:web_app/widget/sidebar.dart/sidebar.dart';
import 'package:web_app/widget/tabbar/tabbar_widget.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ApiBloc>().add(PendingDriverFetchEvent());
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //menu bar

          const Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: SizedBox(
                  child: Column(
                    children: [
                      MenuNav(),
                      SideBar(),
                    ],
                  ),
                ),
              )),

          //body part

          Expanded(
              flex: 5,
              child: SizedBox(
                child: Container(
                  decoration: const BoxDecoration(
                      color:AppColors.backgroundColor,
                      border: Border(
                          left: BorderSide(
                              color:AppColors.primaryColor))),
                  child: Column(
                    children: [
                      const Navbar(),
                      Expanded(
                        child: BlocBuilder<HomeBloc, HomeState>(
                          builder: (context, state) {
                            if (state is CouponAddNavigateState) {
                              return const CouponsAddScreen();
                            } else if (state is OngoinNavigateState) {
                              return const OngoingCouponScreen();
                            } else {
                              return const TabBars();
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
