import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pill_cart/controller/register_user_controller.dart';

class HomeUserScreen extends StatelessWidget {
  RegisterUserController registerUserController = Get.find();
  // var token = GetStorage().read('token');

  HomeUserScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home user'),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 8),
                blurRadius: 8,
                spreadRadius: -8,
                color: Color.fromARGB(255, 226, 226, 226),
              ),
            ],
          ),
          // decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
          height: 100,
          width: 300,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                  onPressed: () {
                    registerUserController.logout_user();
                  },
                  child: Text("Log out")),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            // child:
          ),
        ),
      ),
    );
  }
}
