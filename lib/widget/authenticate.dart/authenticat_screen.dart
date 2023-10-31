import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:web_app/blocks/api_bloc/api_bloc.dart';
import 'package:web_app/pages/home_screen.dart';
import 'package:web_app/widget/textfields/textfield.dart';

class AthentictionTab extends StatelessWidget {
  const AthentictionTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (BuildContext conter) => signIn(conter),
      tablet: (BuildContext conter) => signInTab(conter),
      mobile: (BuildContext conter) => signInMobile(conter),
    );
  }

  Widget signIn(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    final hight = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Center(
      child: Container(
        width: hight * .6,
        // height: width * .3,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.amber),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Connecting Driver to the public'),
              SizedBox(
                height: hight * .1,
              ),
              const Text(
                'Admin Login ',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: hight * .01,
              ),
              CustomTextfield(
                  text: "Username",
                  controller: usernameController,
                  keyboardType: TextInputType.name,
                  readOnly: false),
              CustomTextfield(
                  text: "Password",
                  controller: passwordController,
                  keyboardType: TextInputType.name,
                  readOnly: false),
              SizedBox(
                height: hight * .02,
              ),
              InkWell(
                onTap: () {
                  context.read<ApiBloc>().add(DriverFetchEvent());
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const Homescreen(),
                  ));
                },
                child: Container(
                  width: width * .3,
                  height: hight * .05,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 0),
                          blurRadius: 10,
                          spreadRadius: 1,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text(
                      ' Login ',
                      style: TextStyle(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget signInTab(BuildContext context) {
    final hight = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Center(
      child: Container(
        width: hight * .9,
        height: width * .5,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.amber),
        ),
      ),
    );
  }

  Widget signInMobile(BuildContext context) {
    final hight = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Center(
      child: Container(
        width: hight * .5,
        height: width * .8,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.amber),
        ),
        child: ElevatedButton(
            onPressed: () {
              context.read<ApiBloc>().add(DriverFetchEvent());
            },
            child: const Text('Call api')),
      ),
    );
  }
}
