import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_app/blocks/api_bloc/api_bloc.dart';
import 'package:web_app/blocks/homebloc/bloc/home_bloc.dart';
import 'package:web_app/models/driver_model.dart';

class PendingDrivers extends StatelessWidget {
  const PendingDrivers({super.key, });
 
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApiBloc, ApiState>(
      builder: (context, state) {
        if (state is LoadingFetchState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is FetchSucessState) {
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
                            itemCount: state.drivers.length,
                            itemBuilder: (context, index) {
                              DriverInfo driver = state.drivers[index];
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: ListTile(
                                            leading: CircleAvatar(
                                              backgroundColor: Colors.black,
                                              radius: 21,
                                              child: CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                    driver.driverImg),
                                              ),
                                            ),
                                            title: Text(driver.name),
                                            trailing: Text(driver.email),
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
                                              context
                                                  .read<HomeBloc>()
                                                  .add(DetailScreenNavigate(driver: driver));
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
        } else if (state is FetchErrorState) {
          return const Center(
            child: Text('Connect your network'),
          );
        }
        return const SizedBox();
      },
    );
  }
}
