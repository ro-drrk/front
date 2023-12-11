// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pill_cart/helper/constant.dart';
import 'package:pill_cart/main.dart';

class CustomTextField extends StatelessWidget {
  var controller;
  String validateMessage;
  TextEditingController textController;
  bool isSuffix;
  bool isPrefix;
  IconData? preIcon;
  bool isScure;

  String label;

  CustomTextField({
    this.controller,
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
    return TextFormField(
      style: customLightTheme.textTheme.bodySmall?.copyWith(
        color: Colors.black,
      ),
      obscureText: isScure ? controller.isScure : false,
      cursorColor: kBrand800,
      cursorHeight: 24,
      cursorOpacityAnimates: true,
      validator: label == 'Phone Number'
          ? (Value) {
              if (Value == null || Value.isEmpty) {
                return validateMessage;
              } else if (!Value.isNum) {
                return 'The phone number must be numbers only';
              } else if (Value.length < 10) {
                return 'you should enter ten digits, ${10 - Value.length} digit/s remain';
              } else if (Value.length > 10) {
                return 'you should enter ten digits, delete ${Value.length - 10} digit/s';
              }
            }
          : (Value) {
              if (Value == null || Value.isEmpty) {
                return validateMessage;
              }
            },
      controller: textController,
      decoration: InputDecoration(
        // constraints: BoxConstraints(minHeight: 100),
        contentPadding: isPrefix
            ? EdgeInsets.symmetric(horizontal: 16, vertical: 0)
            : EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        prefixIcon: isPrefix
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  width: 24,
                  height: 24,
                  child: Icon(
                    preIcon,
                    size: 24,
                    color: kBrand800,
                  ),
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
        labelStyle: customLightTheme.textTheme.labelSmall?.copyWith(
          color: kBrand800,
        ),
        filled: true,
        fillColor: Colors.grey[100],
        errorStyle: customLightTheme.textTheme.labelSmall?.copyWith(
          color: red,
          height: 1,
        ),
        errorMaxLines: 2,
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
  }
}
