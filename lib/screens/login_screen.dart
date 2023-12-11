import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pill_cart/controller/login_controller.dart';
import 'package:pill_cart/helper/constant.dart';
import 'package:pill_cart/main.dart';
import 'package:pill_cart/widgets/buttons/custom_primary_button.dart';
import 'package:pill_cart/widgets/text_fields/custom_text_form_field.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = Get.find();

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Login',
          ),
        ),
        body: GetBuilder<LoginController>(
          builder: (controller) {
            return SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.15,
                      ),
                      Text(
                        "Welcome back",
                        style:
                            customLightTheme.textTheme.displayMedium?.copyWith(
                          color: Colors.black,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Of course you didn't forget your account information, doctor!",
                        style: customLightTheme.textTheme.bodyMedium?.copyWith(
                          color: Colors.black.withOpacity(0.7),
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      CustomTextField(
                        isScure: false,
                        textController: controller.phoneNumberController,
                        label: 'Phone Number',
                        isSuffix: false,
                        preIcon: FontAwesomeIcons.phone,
                        validateMessage: 'Enter your phone number',
                        isPrefix: true,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      CustomTextField(
                        controller: controller,
                        isScure: true,
                        textController: controller.passwordController,
                        label: 'Password',
                        isSuffix: true,
                        preIcon: FontAwesomeIcons.lock,
                        validateMessage: 'Enter a strong password',
                        isPrefix: true,
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      CPrimaryButton(
                        buttonText: "Login",
                        onPressed: () async {
                          if (formkey.currentState!.validate()) {
                            controller.login();
                          }
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      width > 300
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Don\'t have an account?",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        customLightTheme.textTheme.bodySmall),
                                SizedBox(
                                  width: 4,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.offNamed('/register_user');
                                  },
                                  child: Text("Register.",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: customLightTheme
                                          .textTheme.bodySmall
                                          ?.copyWith(
                                        color: kBrand800,
                                        fontFamily: 'Lexend_Bold',
                                        decoration: TextDecoration.underline,
                                      )),
                                ),
                              ],
                            )
                          : Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Don\'t have an account?",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          customLightTheme.textTheme.bodySmall),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.offNamed('/register_user');
                                    },
                                    child: Text(
                                      "Register.",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: customLightTheme
                                          .textTheme.bodySmall
                                          ?.copyWith(
                                        color: kBrand800,
                                        fontFamily: 'Lexend_Bold',
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
