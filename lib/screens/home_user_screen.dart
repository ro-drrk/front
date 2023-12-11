//import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pill_cart/controller/register_user_controller.dart';
import 'package:pill_cart/helper/constant.dart';
import 'package:pill_cart/main.dart';
import 'package:pill_cart/widgets/custom_drawer.dart';

class HomeUserScreen extends StatelessWidget {
  RegisterUserController registerUserController = Get.find();
  HomeUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
          drawerScrimColor: Colors.black.withOpacity(0.7),
          drawer: CustomDrawer(),
          // appBar: AppBar(
          //   leadingWidth: 48,
          //   titleSpacing: 0,
          //   foregroundColor: kBrand800,
          //   title: Text(
          //     'Hi, doctor',
          //   ),
          // ),
          body: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: -8,
                        blurRadius: 8,
                        offset: Offset(0, 6), // changes position of shadow
                      ),
                    ],
                  ),
                  height: 100,
                  width: 300,
                  child: Column(
                    children: [
                      Text(registerUserController.user?.firstName ?? 'hi'),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.pressed))
                                    return kBrand500; // color when button is pressed
                                  return kBrand500; // default color
                                },
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.blue),
                                ),
                              ),
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.all(15)),
                            ),
                            onPressed: () {
                              // Get.toNamed('register_user');
                              registerUserController.logout_user();
                            },
                            child: Text(
                              //registerUserController.user!.firstName ?? 'null',
                              //GetStorage().read('token'),
                              'hi',
                              style: customLightTheme.textTheme.labelLarge
                                  ?.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
} /* */
