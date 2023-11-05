import 'package:flutter/material.dart';
import 'package:web_app/widget/coupons/ongoing_coupons.dart';

class OngoingCouponScreen extends StatelessWidget {
  const OngoingCouponScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            children: [OngoingCoupons()],
          ),
        ),
      ),
    );
  }
}
