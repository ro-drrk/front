import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pill_cart/controller/register_user_controller.dart';
import 'package:pill_cart/helper/constant.dart';
import 'package:pill_cart/main.dart';
import 'package:pill_cart/widgets/buttons/custom_primary_button.dart';
import 'package:pill_cart/widgets/text_fields/custom_text_form_field.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class RegisterUserScreen extends StatefulWidget {
  RegisterUserScreen({super.key});

  @override
  State<RegisterUserScreen> createState() => _RegisterUserScreenState();
}

class _RegisterUserScreenState extends State<RegisterUserScreen> {
  RegisterUserController registerController = Get.find();

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Register',
          style: GoogleFonts.lexend(
            textStyle: TextStyle(
              color: kBrand800,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ),
      ),
      body: GetBuilder<RegisterUserController>(
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
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Text(
                      "Create your new account",
                      style: customTheme.textTheme.headlineLarge?.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Hi doctor, Please enter your details to start makeing some orders.",
                      style: customTheme.textTheme.bodyMedium?.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CustomTextField(
                            getController: controller,
                            isScure: false,
                            textController: controller.firstNameController,
                            label: 'First Name',
                            isSuffix: false,
                            preIcon: null,
                            validateMessage: 'Enter your first name',
                            isPrefix: false,
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: CustomTextField(
                            getController: controller,
                            isScure: false,
                            textController: controller.lastNameController,
                            label: 'Last Name',
                            isSuffix: false,
                            preIcon: null,
                            validateMessage: 'Enter your last name',
                            isPrefix: false,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
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
                      buttonText: "Register",
                      onPressed: () async {
                        if (formkey.currentState!.validate()) {
                          controller.register_user();
                        }

                        // print(await registerController.token());
                        //SharedPreferences t = await registerController.getToken();

                        //print(t.getString('token'));
                      },
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Alreadey a member?",
                          style: GoogleFonts.lexend(
                            textStyle: TextStyle(
                              //fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.offNamed('/login');
                          },
                          child: Text(
                            "Login.",
                            style: GoogleFonts.lexend(
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

/* */