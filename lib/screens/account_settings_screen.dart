import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pill_cart/controller/register_user_controller.dart';
import 'package:pill_cart/helper/constant.dart';
import 'package:pill_cart/models/user_model.dart';
import 'package:pill_cart/widgets/custom_drawer.dart';

class AccountSettingsScreen extends StatelessWidget {
  RegisterUserController registerUserController = Get.find();

  AccountSettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // User user = registerUserController.user;
    return SafeArea(
      child: Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          titleSpacing: 0,
          foregroundColor: kBrand800,
          title: Text(
            'Hi, doctor',
          ),
        ),
        body: Center(
          child: Column(
            children: [Text(registerUserController.user?.firstName ?? 'ii')],
          ),
        ),
      ),
    );
  }
}
