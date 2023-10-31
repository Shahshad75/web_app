import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:web_app/blocks/detail_bloc/detail_bloc.dart';
import 'package:web_app/blocks/homebloc/bloc/home_bloc.dart';
import 'package:web_app/models/driver_model.dart';
import 'package:web_app/pages/image_screen.dart';
import 'package:web_app/pages/pending_drivers.dart';
import 'package:web_app/widget/info_widgest/info_.dart';
import 'package:web_app/widget/info_widgest/info_text.dart';
import 'package:web_app/widget/info_widgest/uploaded_image.dart';
import 'package:web_app/widget/pop_snacbar.dart/pop_messages.dart';

class PendingReq extends StatefulWidget {
  const PendingReq({super.key});

  @override
  State<PendingReq> createState() => _PendingReqState();
}

class _PendingReqState extends State<PendingReq> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (BuildContext context) => BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is DetailNavigateState) {
            return cons2(state.driver);
          } else {
            return const PendingDrivers();
          }
        },
      ),
    );
  }

  Widget cons2(DriverInfo driver) {
    PopMessages popMessages = PopMessages();
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 30),
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.sizeOf(context).height + 400,
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                  spreadRadius: 2.0,
                  offset: Offset(0, 3),
                ),
              ],
              border: Border.all(color: Colors.amber)),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Note: Users can access the application as a common user until the profile is approved by the administrator.',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(),
                    SizedBox(
                      width: double.maxFinite,
                      height: 320,
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: SizedBox(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                            radius: 100,
                                            backgroundImage:
                                                NetworkImage(driver.driverImg)),
                                        const SizedBox(
                                          height: 25,
                                        ),
                                        Text(
                                          driver.name,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    const VerticalDivider()
                                  ],
                                ),
                              )),
                          Expanded(
                              flex: 6,
                              child: SizedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        flex: 4,
                                        child: SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width +
                                                  450,
                                          child: Row(
                                            children: [
                                              const SizedBox(
                                                width: 150,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    InfoTexts(text: 'Email'),
                                                    InfoTexts(
                                                        text: 'Phone No.'),
                                                    InfoTexts(text: 'Gender'),
                                                    InfoTexts(
                                                        text: 'BirthDate'),
                                                    InfoTexts(
                                                        text: 'Expirience')
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                  child: SizedBox(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    InfoTexts(
                                                        text: driver.email),
                                                    InfoTexts(
                                                        text:
                                                            driver.phoneNumber),
                                                    InfoTexts(
                                                        text: driver.gender),
                                                    InfoTexts(
                                                        text: driver.birthDate),
                                                    InfoTexts(
                                                        text:
                                                            '+${driver.experience}')
                                                  ],
                                                ),
                                              ))
                                            ],
                                          ),
                                        )),
                                    Expanded(
                                        child: SizedBox(
                                      width: 400,
                                      child: Row(
                                        children: [
                                          TextButton(
                                              onPressed: () {
                                                popMessages
                                                    .showSnackBar(context);
                                              },
                                              child: const Text(
                                                'Approve',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                          const SizedBox(
                                            width: 40,
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                popMessages
                                                    .rejectSnacbar(context);
                                              },
                                              child: const Text(
                                                'Reject',
                                                style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ))
                                        ],
                                      ),
                                    )),
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                    const Divider(),
                    Expanded(
                        child: SizedBox(
                            child: Padding(
                      padding: const EdgeInsets.only(left: 80.0),
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          const Text(
                            "Vehicle Details",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Info(
                            text: 'Vehicle Brand',
                            informs1: Text(driver.vehicleBrand),
                            informs2: const SizedBox(),
                          ),
                          Info(
                            text: 'Model',
                            informs1: Text(driver.vehicleModel),
                            informs2: const SizedBox(),
                          ),
                          Info(
                            text: 'Year',
                            informs1: Text(driver.vehicleModel),
                            informs2: const SizedBox(),
                          ),
                          Info(
                            text: 'Color',
                            informs1: Text(driver.vehicleColor),
                            informs2: const SizedBox(),
                          ),
                          Info(
                            text: 'Seats',
                            informs1: Text(driver.vehicleSeat),
                            informs2: const SizedBox(),
                          ),
                          Info(
                            text: 'Number',
                            informs1: Text(driver.vehicleNumber),
                            informs2: const SizedBox(),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 25, bottom: 10),
                            child: Text(
                              "Documets Details",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Info(
                              text: "License No.",
                              informs1: Text(driver.licenseNo),
                              informs2: const SizedBox()),
                          Info(
                            text: "License Expire Date",
                            informs1: Text(driver.licenceExp),
                            informs2: const SizedBox(),
                          ),

                          // images//
                          Info(
                            text: "License Images",
                            informs1: BlocBuilder<DetailBloc, DetailState>(
                              builder: (context, state) {
                                return UploadedImage(
                                  onHover: (value) {
                                    context.read<DetailBloc>().add(
                                        ImageHoveEvent1(
                                            isHover: value,
                                            image: driver.licenceFront));
                                  },
                                  text: "License front",
                                  onDoubleTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          ImageScreen(url: driver.licenceFront),
                                    ));
                                  },
                                );
                              },
                            ),
                            informs2: BlocBuilder<DetailBloc, DetailState>(
                              builder: (context, state) {
                                return UploadedImage(
                                  onHover: (value) {
                                    context.read<DetailBloc>().add(
                                        ImageHoveEvent2(
                                            isHover: value,
                                            image: driver.licenceBack));
                                  },
                                  text: "License back",
                                  onDoubleTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          ImageScreen(url: driver.licenceBack),
                                    ));
                                  },
                                );
                              },
                            ),
                          ),
                          const Info(
                              text: "AdharCard No.",
                              informs1: Text('11005440484848'),
                              informs2: SizedBox()),
                          const Info(
                              text: "Address",
                              informs1: Text('44521541651451'),
                              informs2: SizedBox()),
                          Info(
                            text: "AdharImage",
                            informs1: BlocBuilder<DetailBloc, DetailState>(
                              builder: (context, state) {
                                return UploadedImage(
                                  onHover: (value) {
                                    context.read<DetailBloc>().add(
                                        ImageHoveEvent3(
                                            isHover: value,
                                            image: driver.adharFront));
                                  },
                                  text: "Adhar front",
                                  onDoubleTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          ImageScreen(url: driver.adharFront),
                                    ));
                                  },
                                );
                              },
                            ),
                            informs2: BlocBuilder<DetailBloc, DetailState>(
                              builder: (context, state) {
                                return UploadedImage(
                                  onHover: (value) {
                                    context.read<DetailBloc>().add(
                                        ImageHoveEvent4(
                                            isHover: value,
                                            image: driver.adharBack));
                                  },
                                  text: "Adhar back",
                                  onDoubleTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          ImageScreen(url: driver.adharBack),
                                    ));
                                  },
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          )
                        ],
                      ),
                    )))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
