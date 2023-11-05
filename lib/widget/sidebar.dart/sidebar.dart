import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:web_app/blocks/homebloc/bloc/home_bloc.dart';
import 'package:web_app/utils/colors.dart';
import 'package:web_app/widget/pop_snacbar.dart/pop_messages.dart';
import 'expandtile.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (BuildContext context) => sidebar(context),
    );
  }

  Widget sidebar(BuildContext context) {
    PopMessages popMessages = PopMessages();
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
                onTap: () {
                  context.read<HomeBloc>().add(PendingEvent());
                },
              ),
              ExpandTile(
                title: "Approved Drivers",
                onTap: () {
                  context.read<HomeBloc>().add(ApprovedEvent());
                },
              ),
              ExpandTile(
                title: "Rejected Drivers",
                onTap: () {
                  context.read<HomeBloc>().add(RejectEvent());
                },
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ExpansionTile(
            initiallyExpanded: true,
            textColor: Colors.black,
            collapsedTextColor: Colors.black,
            title: Text(
              'Coupons Side',
              style: GoogleFonts.poppins(
                  fontSize: 19, fontWeight: FontWeight.w500),
            ),
            children: [
              ExpandTile(
                title: "Add coupons",
                onTap: () {
                  context.read<HomeBloc>().add(CouponAddNavigateEvent());
                },
              ),
              ExpandTile(
                title: "On-Going coupons",
                onTap: () {
                  context.read<HomeBloc>().add(OngoingScreenNavigateEvent());
                },
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
                      MaterialStateProperty.all<Color>(AppColors.primaryColor),
                ),
                onPressed: () {
                  popMessages.logOut(context);
                },
                child: const Text('LogOut')))
      ],
    );
  }

  Widget adminProfile() {
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color:AppColors.primaryColor, width: 0.5))),
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
