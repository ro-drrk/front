import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pill_cart/controller/login_controller.dart';
import 'package:pill_cart/helper/constant.dart';
import 'package:pill_cart/widgets/buttons/custom_primary_button.dart';
import 'package:pill_cart/widgets/text_fields/custom_text_form_field.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = Get.put(LoginController());

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Login',
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              color: kBrand800,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
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
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      "Welcome back",
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 48,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "nourt dktooor",
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          //fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    CustomTextField(
                      getController: controller,
                      isScure: false,
                      textController: controller.phoneNumberController,
                      label: 'Phone Number',
                      isSuffix: false,
                      preIcon: Icons.phone,
                      validateMessage: 'Enter your phone number',
                      isPrefix: true,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                      getController: controller,
                      isScure: true,
                      textController: controller.passwordController,
                      label: 'Password',
                      isSuffix: true,
                      preIcon: Icons.lock,
                      validateMessage: 'Enter a strong password',
                      isPrefix: true,
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    CPrimaryButton(
                      buttonText: "Login",
                      onPressed: () async {
                        if (formkey.currentState!.validate()) {
                          controller.login();
                        }

                        // print(await registerController.token());
                        //SharedPreferences t = await registerController.getToken();

                        //print(t.getString('token'));
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Divider(
                      thickness: 2,
                      endIndent: 8,
                      indent: 8,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don\'t have an account?",
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              //fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.offNamed('/register_user');
                          },
                          child: Text(
                            "Register.",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                color: kBrand800,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 32,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
