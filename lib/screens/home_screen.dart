import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pill_cart/controller/register_controller.dart';

class HomeScreen extends StatelessWidget {
  RegisterController registerController = Get.put(RegisterController());

  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed('/register');
          },
          child: Text("Logout"),
        ),
      ),
    );
  }
}
