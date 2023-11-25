import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pill_cart/helper/constant.dart';
import 'package:pill_cart/widgets/buttons/custom_primary_button.dart';
import 'package:pill_cart/widgets/text_fields/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  bool isObscure = true;

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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 32,
              ),
              Text(
                "Welcome back doctor",
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 48,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Welcome back doctor, nice to see you again.",
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
              CTextFormField(
                preIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(
                    Icons.phone,
                    color: kBrand800,
                  ),
                ),
                sufIcon: null,
                labelText: "Phone Number",
                preText: "+963 ",
              ),
              SizedBox(
                height: 16,
              ),
              CTextFormField(
                passwordInVisible: true,
                isSuffixIcon: true,
                preIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(
                    Icons.lock,
                    color: kBrand800,
                  ),
                ),
                sufIcon: Icons.remove_red_eye,
                labelText: "Password",
                preText: null,
              ),
              SizedBox(
                height: 20,
              ),
              CPrimaryButton(buttonText: "Login"),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
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
                      Get.offNamed('/register');
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
  }
}
