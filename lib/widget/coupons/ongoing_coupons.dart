import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class OngoingCoupons extends StatelessWidget {
  const OngoingCoupons({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (BuildContext context) => body(context),
    );
  }

  Widget title() {
    return Container(
      alignment: Alignment.centerLeft,
      width: double.infinity,
      height: 70,
      color: const Color.fromARGB(91, 255, 193, 7),
      child: const Padding(
        padding: EdgeInsets.only(left: 20),
        child: Text(
          "OnGoing Coupons",
          style: TextStyle(
              color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        height: MediaQuery.sizeOf(context).height * .85,
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: Colors.white, border: Border.all(color: Colors.amber)),
        child: Column(
          children: [
            title(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                  ),
                  itemCount: 16,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        // color: const Color.fromARGB(255, 243, 222, 33),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                            border: Border.all(color: Colors.amber)),
                        child: Column(
                          children: [
                            Expanded(
                                child: Container(
                              width: double.maxFinite,
                              decoration: const BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30)),
                              ),
                              child: Center(child: Text('Coupons $index')),
                            )),
                            Expanded(flex: 3, child: Container())
                          ],
                        ));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
