import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:pill_cart/utils/api_endpoints.dart';
import 'package:pill_cart/widgets/custom_snackbar.dart';
import 'package:pill_cart/widgets/custom_loader.dart';
//import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  late bool isScure;

  late TextEditingController phoneNumberController, passwordController;
  // SharedPref pref = SharedPref();
  // Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void onInit() {
    super.onInit();
    isScure = true;
    phoneNumberController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    isScure = true;
    phoneNumberController.dispose();
    passwordController.dispose();
  }

  visiblPassword() {
    isScure = !isScure;
    update();
  }

  login() async {
    try {
      Loader.showLoading();

      var resopnse = await http.post(
        Uri.parse(baseUrl + 'login'),
        body: {
          'phoneNumber': phoneNumberController.text,
          'password': passwordController.text,
        },
      );

      if (resopnse.statusCode == 200) {
        var data = await jsonDecode(resopnse.body);
        if (data['message'] == "Wrong password") {
          Loader.hideLoading();
          customSnackbar("Failed!", "Wrong password", "error");
        } else if (data['message'] == "Wrong phone number") {
          Loader.hideLoading();
          customSnackbar("Failed!", "Wrong phone number", "error");
        } else {
          if (data['user']['role'] == 'Admin') {
            var token = data['token'];
            var storage = GetStorage();
            storage.write('token', token);
            phoneNumberController.clear();
            passwordController.clear();
            Loader.hideLoading();
            customSnackbar("success", "Logged in!", "success");

            Get.offAllNamed("/home_admin");
          } else {
            var token = data['token'];
            var storage = GetStorage();
            storage.write('token', token);
            Loader.hideLoading();
            customSnackbar("success", "Logged in!", "success");

            Get.offAllNamed("/home_user");
          }
        }
      } else {
        Loader.hideLoading();

        customSnackbar("Ex", "Ex", "error");
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
}
