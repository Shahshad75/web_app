import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:web_app/widget/info_widgest/info_.dart';
import 'package:web_app/widget/info_widgest/info_text.dart';
import 'package:web_app/widget/info_widgest/uploaded_image.dart';

import '../../main.dart';

class PendingReq extends StatefulWidget {
  const PendingReq({super.key});

  @override
  State<PendingReq> createState() => _PendingReqState();
}

class _PendingReqState extends State<PendingReq> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (BuildContext context) => isSelected ? cons2() : cons(),
    );
  }

  Widget cons2() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 30),
      child: SingleChildScrollView(
        //physics: const NeverScrollableScrollPhysics(),
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
            child: Column(
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                      width: MediaQuery.sizeOf(context).width +
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
                                                InfoTexts(text: 'Phone No.'),
                                                InfoTexts(text: 'Gender'),
                                                InfoTexts(text: 'BirthDate'),
                                                InfoTexts(text: 'Expirience')
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
                                                    text: 'shahshd@gmail.com'),
                                                InfoTexts(text: '7584652300'),
                                                InfoTexts(text: 'Male'),
                                                InfoTexts(text: '13/04/2002'),
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
                                      TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                            'Approve',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )),
                                      const SizedBox(
                                        width: 40,
                                      ),
                                      TextButton(
                                          onPressed: () {},
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
                      Info(
                        text: "License Images",
                        informs1: UploadedImage(
                          text: "License front",
                          onDoubleTap: () {},
                        ),
                        informs2: UploadedImage(
                          text: "License back",
                          onDoubleTap: () {},
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
                        informs1: UploadedImage(
                          text: "Adhar front",
                          onDoubleTap: () {},
                        ),
                        informs2: UploadedImage(
                          text: "Adhar back",
                          onDoubleTap: () {},
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
          ),
        ),
      ),
    );
  }

  Widget cons() {
    return Container(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, right: 30),
        child: Container(
          width: double.maxFinite,
          height: 650,
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
            child: Column(
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
                Expanded(
                  child: SizedBox(
                    width: double.maxFinite,
                    child: ListView.builder(
                      itemCount: 100,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Expanded(
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        backgroundColor: Colors.black,
                                        radius: 21,
                                        child: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/admin.jpg'),
                                        ),
                                      ),
                                      title: Text('shahshad babu'),
                                      trailing: Text('shahshadbabu@gamil.com'),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 50,
                                  ),
                                  ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.amber),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          isSelected = true;
                                        });
                                        // Navigator.of(context).push(
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             const ApprovedDrivers()));
                                      },
                                      child: const Text('View Profile'))
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Divider(),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}