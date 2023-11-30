// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pill_cart/controller/register_user_controller.dart';
import 'package:pill_cart/helper/constant.dart';
import 'package:pill_cart/main.dart';

class CustomTextField extends StatelessWidget {
  GetxController getController;
  String validateMessage;
  TextEditingController textController;
  bool isSuffix;
  bool isPrefix;
  IconData? preIcon;
  bool isScure;

  String label;

  CustomTextField({
    required this.getController,
    required this.validateMessage,
    required this.textController,
    required this.isSuffix,
    required this.isPrefix,
    required this.preIcon,
    required this.isScure,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterUserController>(
      builder: (controller) {
        return TextFormField(
          obscureText: isScure ? controller.isScure : false,
          cursorColor: kBrand800,
          cursorHeight: 24,
          cursorOpacityAnimates: true,
          validator: label == 'Phone Number'
              ? (value) {
                  if (value == null || value.isEmpty) {
                    return validateMessage;
                  } else if (value!.length != 10) {
                    return 'The phone number must be ten digits long';
                  }
                }
              : (value) {
                  if (value == null || value.isEmpty) {
                    return validateMessage;
                  }
                },
          controller: textController,
          decoration: InputDecoration(
            constraints: BoxConstraints(maxHeight: 100),
            contentPadding: isPrefix
                ? EdgeInsets.symmetric(horizontal: 16, vertical: 0)
                : EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            prefixIcon: isPrefix
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Icon(
                      preIcon,
                      color: kBrand800,
                    ),
                  )
                : null,
            suffixIcon: isSuffix
                ? IconButton(
                    splashRadius: 1,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    onPressed: () {
                      controller.visiblPassword();
                    },
                    icon: controller.isScure
                        ? Icon(
                            Icons.visibility,
                          )
                        : Icon(Icons.visibility_off),
                    focusColor: kBrand200,
                    color: kBrand800,
                  )
                : null,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            labelText: label,
            labelStyle: customTheme.textTheme.labelSmall?.copyWith(
              color: kBrand800,
            ),
            filled: true,
            fillColor: Colors.grey[100],
            errorStyle: customTheme.textTheme.labelSmall?.copyWith(
              color: red,
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: red,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: red,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: kBrand800,
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      },
    );
  }
}
