import 'package:flutter/material.dart';
import 'package:get/get.dart';

customSnackbar(title, message, type) {
  Get.snackbar(
    isDismissible: false,
    duration: Duration(seconds: 3),
    snackStyle: SnackStyle.FLOATING,
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: type == "error" ? Colors.red[400] : Colors.green[400],
    colorText: Colors.black,
  );
}
