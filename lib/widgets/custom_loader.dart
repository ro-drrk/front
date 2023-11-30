import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pill_cart/helper/constant.dart';

class Loader {
  static void showLoading() {
    Get.dialog(
      barrierColor: kBrand100.withOpacity(0.5),
      barrierDismissible: false,
      Dialog(
        elevation: 0,
        shadowColor: null,
        backgroundColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(
                color: kBrand800,
                strokeWidth: 6,
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void hideLoading() {
    if (Get.isDialogOpen!) Get.back();
  }
}
