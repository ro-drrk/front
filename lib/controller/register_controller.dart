import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pill_cart/screens/home_screen.dart';
import 'package:pill_cart/utils/api_endpoints.dart';
import 'package:pill_cart/widgets/custom_snackbar.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class RegisterController extends GetxController {

  RxBool isVisibl = false.obs;

  late TextEditingController firstNameController,
      lastNameController,
      phoneNumberController,
      passwordController;

  // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void onInit() {
    super.onInit();

    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    phoneNumberController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();

    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
  }

  register() async {
    try {
      var resopnse = await http.post(
        Uri.parse(baseUrl + 'register/user'),
        body: {
          'firstName': firstNameController.text,
          'lastName': lastNameController.text,
          'phoneNumber': phoneNumberController.text,
          'password': passwordController.text,
        },
      );

      if (resopnse.statusCode == 200) {
        var data = await jsonDecode(resopnse.body);
        var token = data['token'];
        print(token);
        //final SharedPreferences? prefs = await _prefs;
       // await prefs?.setString('token', token);
        customSnackbar("success", "Registeration completed!", "success");
        Get.toNamed("/home");
      } else {
        customSnackbar(
            "Failed!", "The phone number has already been taken.", "error");
      }
    } catch (e) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          });
    }
  }
}
  // Future<void> register() async {
  //   try {
  //     http.Response response = await http
  //         .post(Uri.parse('http://127.0.0.1:8000/api/register/admin'), body: {
  //       'firstName': firstNameController.text,
  //       'lastName': lastNameController.text,
  //       'phoneNumber': phoneNumberController.text,
  //       'password': passwordController.text,
  //     });
  //     Map<String, dynamic> data = jsonDecode(response.body);
  //     if (response.statusCode == 200) {
  //       if (data['message'] == 'register is true') {
  //         var token = data['token'];
  //         // print(token);
  //         final SharedPreferences? prefs = await _prefs;
  //         await prefs?.setString('token', token);

  //         firstNameController.clear();
  //         lastNameController.clear();
  //         phoneNumberController.clear();
  //         firstNameController.clear();
  //         passwordController.clear();

  //         print(prefs?.getString('token'));
  //         print(response.body);

  //         Get.to(HomeScreen());
  //       }
  //     } else {
  //       print(data['message']);
  //     }
  //   } catch (e) {
  //     showDialog(
  //         context: Get.context!,
  //         builder: (context) {
  //           return SimpleDialog(
  //             title: Text('Error'),
  //             contentPadding: EdgeInsets.all(20),
  //             children: [Text(e.toString())],
  //           );
  //         });
  //   }

  //   //print(data['token']);
  // }

  // Future<String> token() async {
  //   final SharedPreferences? prefs = await _prefs;
  //   String? t = prefs?.getString('token');
  //   if (t != null) {
  //     return t;
  //   }
  //   return "error";
  // }

  // Future<SharedPreferences> getToken() async {
  //   Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  //   return _prefs;
  // }


