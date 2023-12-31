import 'package:flutter/material.dart';
import 'package:web_app/utils/colors.dart';
import 'package:web_app/widget/coupons/coupon_add_container.dart';

class CouponsAddScreen extends StatelessWidget {
  const CouponsAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
            color:AppColors.backgroundColor, border: Border.all(color:AppColors.primaryColor)),
        child: Column(
          children: [CouponAddWindow()],
        ),
      ),
    )));
  }
}
