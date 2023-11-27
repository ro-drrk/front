import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pill_cart/controller/register_controller.dart';
import 'package:pill_cart/helper/constant.dart';
import 'package:pill_cart/widgets/custom_snackbar.dart';
import 'package:pill_cart/widgets/buttons/custom_primary_button.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterController registerController = Get.put(RegisterController());

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
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              color: kBrand800,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ),
      ),
      body: GetBuilder<RegisterController>(
        builder: (controller) {
          return SingleChildScrollView(
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
                      "Create your new account",
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
                      "Hi doctor, Please enter your details to start makeing some orders.",
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          //fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            fontSize: 16,
                            color: kBrand950,
                            fontWeight: FontWeight.bold),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "enter your first name";
                        }
                      },
                      controller: controller.firstNameController,
                      decoration: InputDecoration(
                        // hintText: 'enter your First Name',
                        labelText: 'First Name',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        labelStyle: GoogleFonts.inter(
                          textStyle: TextStyle(fontSize: 16, color: kBrand800),
                        ),
                        prefixStyle: GoogleFonts.inter(
                          textStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        filled: true,
                        fillColor: kBrand100,
                        // constraints: BoxConstraints(minHeight: 46),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: kBrand800,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8)),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 24),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "enter your last name";
                        }
                      },
                      controller: controller.lastNameController,
                      decoration: InputDecoration(
                        hintText: 'Last Name',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        labelStyle: GoogleFonts.inter(
                          textStyle:
                              TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        prefixStyle: GoogleFonts.inter(
                          textStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                        // constraints: BoxConstraints(minHeight: 46),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: kBrand800,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8)),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 24),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "enter your phone number";
                        }
                      },
                      controller: controller.phoneNumberController,
                      decoration: InputDecoration(
                        hintText: 'Phone Number',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        labelStyle: GoogleFonts.inter(
                          textStyle:
                              TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        prefixStyle: GoogleFonts.inter(
                          textStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                        // constraints: BoxConstraints(minHeight: 46),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: kBrand800,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8)),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 24),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "enter your password";
                        }
                      },
                      controller: controller.passwordController,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        labelStyle: GoogleFonts.inter(
                          textStyle:
                              TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        prefixStyle: GoogleFonts.inter(
                          textStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                        // constraints: BoxConstraints(minHeight: 46),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: kBrand800,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8)),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 24),
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    CPrimaryButton(
                      buttonText: "Register",
                      onPressed: () async {
                        if (formkey.currentState!.validate()) {
                          controller.register();
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
                          "Alreadey a member?",
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
                            Get.offNamed('/login');
                          },
                          child: Text(
                            "Login.",
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
