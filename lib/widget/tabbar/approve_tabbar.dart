import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:web_app/blocks/homebloc/bloc/home_bloc.dart';
import 'package:web_app/pages/approved_drivers.dart';
import 'package:web_app/pages/image_screen.dart';
import 'package:web_app/widget/info_widgest/uploaded_image.dart';

import '../../blocks/detail_bloc/detail_bloc.dart';
import '../info_widgest/info_.dart';
import '../info_widgest/info_text.dart';
import '../pop_snacbar.dart/pop_messages.dart';

class ApprovedTabbar extends StatelessWidget {
  const ApprovedTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (BuildContext context) => BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is! ApprovedNavigateState) {
            return ApprovedDrives();
          } else {
            return cons2(context);
          }
        },
      ),
    );
  }

  Widget cons2(BuildContext context) {
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
                          const Expanded(
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
                                              AssetImage('images/admin.jpg'),
                                        ),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        Text(
                                          'Shahsad babu',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.gpp_good,
                                              color: Colors.green,
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              'Approved Driver Sucessfully',
                                              style: TextStyle(
                                                  color: Colors.green),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    VerticalDivider()
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
                                          child: const Row(
                                            children: [
                                              SizedBox(
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
                                                        text:
                                                            'shahshd@gmail.com'),
                                                    InfoTexts(
                                                        text: '7584652300'),
                                                    InfoTexts(text: 'Male'),
                                                    InfoTexts(
                                                        text: '13/04/2002'),
                                                    InfoTexts(text: '+3 Year')
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
                          const Info(
                            text: 'Vehicle Brand',
                            informs1: Text("Toyota"),
                            informs2: SizedBox(),
                          ),
                          const Info(
                            text: 'Model',
                            informs1: Text("x12Max"),
                            informs2: SizedBox(),
                          ),
                          const Info(
                            text: 'Year',
                            informs1: Text("2018"),
                            informs2: SizedBox(),
                          ),
                          const Info(
                            text: 'Color',
                            informs1: Text("White"),
                            informs2: SizedBox(),
                          ),
                          const Info(
                            text: 'Seats',
                            informs1: Text("4 Seats"),
                            informs2: SizedBox(),
                          ),
                          const Info(
                            text: 'Number',
                            informs1: Text("KL 10 M 2988"),
                            informs2: SizedBox(),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 25, bottom: 10),
                            child: Text(
                              "Documets Details",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                          ),
                          const Info(
                              text: "License No.",
                              informs1: Text('44521541651451'),
                              informs2: SizedBox()),
                          const Info(
                            text: "License Expire Date",
                            informs1: Text('10/11/2027'),
                            informs2: SizedBox(),
                          ),

                          // images//
                          Info(
                            text: "License Images",
                            informs1: BlocBuilder<DetailBloc, DetailState>(
                              builder: (context, state) {
                                return UploadedImage(
                                  onHover: (value) {
                                    // context.read<DetailBloc>().add(
                                    //     ImageHoveEvent1(
                                    //         isHover: value,
                                    //         image: ));
                                  },
                                  text: "License front",
                                  onDoubleTap: () {
                                    // Navigator.of(context)
                                    //     .push(MaterialPageRoute(
                                    //   builder: (context) => const ImageScreen(),
                                    // ));
                                  },
                                );
                              },
                            ),
                            informs2: BlocBuilder<DetailBloc, DetailState>(
                              builder: (context, state) {
                                return UploadedImage(
                                  onHover: (value) {
                                    // context.read<DetailBloc>().add(
                                    //     ImageHoveEvent2(
                                    //         isHover: value,
                                    //         image: Imagenumber.image2));
                                  },
                                  text: "License back",
                                  onDoubleTap: () {},
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
                                    // context.read<DetailBloc>().add(
                                    //     ImageHoveEvent3(
                                    //         isHover: value,
                                    //         image: Imagenumber.image3));
                                  },
                                  text: "Adhar front",
                                  onDoubleTap: () {},
                                );
                              },
                            ),
                            informs2: BlocBuilder<DetailBloc, DetailState>(
                              builder: (context, state) {
                                return UploadedImage(
                                  onHover: (value) {
                                    // context.read<DetailBloc>().add(
                                    //     ImageHoveEvent4(
                                    //         isHover: value,
                                    //         image: Imagenumber.image4));
                                  },
                                  text: "Adhar back",
                                  onDoubleTap: () {},
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
