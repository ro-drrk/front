import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pill_cart/controller/register_controller.dart';
import 'package:pill_cart/helper/constant.dart';
import 'package:pill_cart/widgets/buttons/custom_primary_button.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget {
  RegisterController registerController = Get.put(RegisterController());
  // final formkey = GlobalKey<FormState>();

  Login({super.key});
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            //key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    //  registerController.register();

                    // print(await registerController.token());
                    //SharedPreferences t = await registerController.getToken();

                    //print(t.getString('token'));
                  },
                  child: Text("register"),
                ),
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
                  height: 16,
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
                TextFormField(
                  controller: registerController.firstNameController,
                  decoration: InputDecoration(
                    hintText: 'first name',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: registerController.lastNameController,
                  decoration: InputDecoration(
                    hintText: 'last name',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: registerController.phoneNumberController,
                  decoration: InputDecoration(
                    hintText: 'phone',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: registerController.passwordController,
                  decoration: InputDecoration(
                    hintText: 'password',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CPrimaryButton(
                  buttonText: "Register",
                  onPressed: () {},
                ),
                SizedBox(
                  height: 20,
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
      ),
    );
  }
}
