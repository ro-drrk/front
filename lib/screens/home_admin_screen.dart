import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pill_cart/controller/register_admin_controller.dart';

class HomeAdminScreen extends StatelessWidget {
  RegisterAdminController registerAdminController = Get.find();
  // var token = GetStorage().read('token');

  HomeAdminScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home admin'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            registerAdminController.logout_admin();
          },
          child: Text("Logout"),
        ),
      ),
    );
  }
}
