import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:pill_cart/utils/api_endpoints.dart';
import 'package:pill_cart/widgets/custom_snackbar.dart';

class RegisterAdminController extends GetxController {
  RxBool isVisibl = false.obs;

  late TextEditingController firstNameController,
      lastNameController,
      phoneNumberController,
      passwordController;

  // SharedPref pref = SharedPref();
  // Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

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

  register_admin() async {
    try {
      var resopnse = await http.post(
        Uri.parse(baseUrl + 'register/admin'),
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
        var storage = GetStorage();
        storage.write('token', token);
        print(GetStorage().read('token'));
        //firstNameController.clear();
       // lastNameController.clear();
        phoneNumberController.clear();
        passwordController.clear();
        customSnackbar("success", "Registeration completed!", "success");
        Get.offNamed("/home_admin");
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
        },
      );
    }
  }

  logout_admin() async {
    try {
      var token = GetStorage().read('token');
      var resopnse = await http.post(
        Uri.parse(baseUrl + 'logout'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      var storage = GetStorage();
      storage.remove('token');

      if (resopnse.statusCode == 200) {
        var data = await jsonDecode(resopnse.body);

        customSnackbar("success", "Logged out", "success");
        Get.offNamed("/register_admin");
      } else {
        customSnackbar("Failed!", "there is an error", "error");
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
