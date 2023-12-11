import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pill_cart/controller/register_user_controller.dart';
import 'package:pill_cart/helper/constant.dart';
import 'package:pill_cart/main.dart';
import 'package:pill_cart/models/user_model.dart';
import 'package:pill_cart/widgets/buttons/custom_primary_button.dart';
import 'package:pill_cart/widgets/text_fields/custom_text_form_field.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class RegisterUserScreen extends StatelessWidget {
  RegisterUserScreen({super.key});

  RegisterUserController registerUserController = Get.put(RegisterUserController());

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
            'Register',
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
                        height: height * 0.15,
                      ),
                      Text(
                        "Create your new account",
                        style:
                            customLightTheme.textTheme.displayMedium?.copyWith(
                          color: Colors.black,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Hi doctor, Please enter your details to start makeing some orders.",
                        style: customLightTheme.textTheme.bodyMedium?.copyWith(
                          color: Colors.black.withOpacity(0.7),
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      width > 350
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                    isScure: false,
                                    textController:
                                        controller.firstNameController,
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
                                    isScure: false,
                                    textController:
                                        controller.lastNameController,
                                    label: 'Last Name',
                                    isSuffix: false,
                                    preIcon: null,
                                    validateMessage: 'Enter your last name',
                                    isPrefix: false,
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextField(
                                  isScure: false,
                                  textController:
                                      controller.firstNameController,
                                  label: 'First Name',
                                  isSuffix: false,
                                  preIcon: null,
                                  validateMessage: 'Enter your first name',
                                  isPrefix: false,
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                CustomTextField(
                                  isScure: false,
                                  textController: controller.lastNameController,
                                  label: 'Last Name',
                                  isSuffix: false,
                                  preIcon: null,
                                  validateMessage: 'Enter your last name',
                                  isPrefix: false,
                                ),
                              ],
                            ),
                      SizedBox(
                        height: 16,
                      ),
                      CustomTextField(
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
                        controller: controller,
                        isScure: true,
                        textController: controller.passwordController,
                        label: 'Password',
                        isSuffix: true,
                        preIcon: Icons.lock,
                        validateMessage: 'Enter a strong password',
                        isPrefix: true,
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      CPrimaryButton(
                        buttonText: "Register",
                        onPressed: () async {
                          if (formkey.currentState!.validate()) {
                            controller.registerUser();
                            // Get.toNamed('/home_user');
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
                                Text("Already a member?",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        customLightTheme.textTheme.bodySmall),
                                SizedBox(
                                  width: 4,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.offNamed('/login');
                                  },
                                  child: Text("Login.",
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Already a member?",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          customLightTheme.textTheme.bodySmall),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.offNamed('/login');
                                    },
                                    child: Text("Login.",
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
                              ),
                            )
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

/*

*/