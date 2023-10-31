import 'package:flutter/material.dart';



class RejectedDrivers extends StatelessWidget {
  const RejectedDrivers({super.key, });

  @override
  Widget build(BuildContext context) {
    return  Container(
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
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 20, bottom: 20),
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

                          //list view buidlder//

                          child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                          
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                      const  Expanded(
                                          child: ListTile(
                                            leading: CircleAvatar(
                                              radius: 21,
                                              child: CircleAvatar(
                                             //   backgroundImage: NetworkImage(
                                               //     driver.driverImg),
                                              backgroundColor: Colors.black,
                                              ),
                                            ),
                                            title: Text("driver.name"),
                                            trailing: Text("driver.email"),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 50,
                                        ),
                                        ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(Colors.amber),
                                            ),
                                            onPressed: () {
                                              // context
                                              //     .read<HomeBloc>()
                                              //     .add(event);
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
