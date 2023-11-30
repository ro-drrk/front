import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:pill_cart/models/user_model.dart';
import 'package:pill_cart/utils/api_endpoints.dart';
import 'package:pill_cart/widgets/custom_snackbar.dart';
import 'package:pill_cart/widgets/custom_loader.dart';

class RegisterUserController extends GetxController {
  late bool isScure;
 
  User? user;
  late TextEditingController firstNameController,
      lastNameController,
      phoneNumberController,
      passwordController;

  @override
  void onInit() {
    super.onInit();

    isScure = true;


    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    phoneNumberController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();

    isScure = true;

    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
  }

  visiblPassword() {
    isScure = !isScure;
    update();
  }

  registerUser() async {
    try {
      Loader.showLoading();
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

        GetStorage storage = GetStorage();
        storage.write('token', token);

        user = User.fromJson(data['user']);
        firstNameController.clear();
        lastNameController.clear();
        phoneNumberController.clear();
        passwordController.clear();
        Loader.hideLoading();
        customSnackbar("success", "Registeration completed!", "success");
        Get.offAllNamed("/home_user");
      } else {
        Loader.hideLoading();
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

  logout_user() async {
    try {
      Loader.showLoading();

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
        customSnackbar("success", "Logged out", "success");
        Loader.hideLoading();
        Get.offAllNamed("/register_user");
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
