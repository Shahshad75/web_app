import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:web_app/blocks/coupon_bloc/bloc/coupon_bloc.dart';
import 'package:web_app/widget/textfields/textfield.dart';

// ignore: must_be_immutable
class CouponAddWindow extends StatelessWidget {
  CouponAddWindow({super.key});
  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  DateTime endedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (BuildContext context) => body(context),
    );
  }

  Widget title(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: const Color.fromARGB(96, 255, 193, 7),
        width: double.maxFinite,
        height: MediaQuery.sizeOf(context).height * .10,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text(
              'Coupons Creation',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(161, 111, 92, 35)),
            ),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.amber),
                ),
                onPressed: () {},
                child: const Text("Add Coupon"))
          ]),
        ),
      ),
    );
  }

  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        child: Column(
          children: [
            title(context),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTextfield(
                      text: "Cuopon Code",
                      keyboardType: TextInputType.none,
                      suffixIcon: Icon(Icons.album_outlined),
                      readOnly: false,
                    ),
                    const CustomTextfield(
                      text: "Discount Percentage",
                      keyboardType: TextInputType.number,
                      suffixIcon: Icon(Icons.percent),
                      readOnly: false,
                    ),
                    BlocBuilder<CouponBloc, CouponState>(
                      builder: (context, state) {
                        if (state is StartDateState) {
                          selectedDate = state.startdate;
                        }
                        return CustomTextfield(
                          hintext: DateFormat.yMMMMd().format(selectedDate),
                          controller: startDateController,
                          text: "Starting Date",
                          keyboardType: TextInputType.datetime,
                          suffixIcon: IconButton(
                              onPressed: () {
                                context
                                    .read<CouponBloc>()
                                    .add(StartDatePicEvent(context: context));
                              },
                              icon: const Icon(Icons.date_range_outlined)),
                          readOnly: true,
                        );
                      },
                    ),
                    BlocBuilder<CouponBloc, CouponState>(
                      builder: (context, state) {
                        if (state is EndDateState) {
                          endedDate = state.endDate;
                        }
                        return CustomTextfield(
                          hintext: DateFormat.yMMMMd().format(endedDate),
                          controller: endDateController,
                          text: "Ending Date",
                          keyboardType: TextInputType.datetime,
                          suffixIcon: IconButton(
                              onPressed: () {
                                context
                                    .read<CouponBloc>()
                                    .add(EndDatePicEvent(context: context));
                              },
                              icon: const Icon(Icons.date_range_outlined)),
                          readOnly: true,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
