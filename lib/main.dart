import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pill_cart/controller/register_admin_controller.dart';
import 'package:pill_cart/controller/register_user_controller.dart';
import 'package:pill_cart/helper/constant.dart';
import 'package:pill_cart/screens/home_admin_screen.dart';
import 'package:pill_cart/screens/home_user_screen.dart';
import 'package:pill_cart/screens/login_screen.dart';
import 'package:pill_cart/screens/register_admin_screen.dart';
import 'package:pill_cart/screens/register_user_screen.dart';

void main() async {
  GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  RegisterUserController registerUserController =
      Get.put(RegisterUserController());
  RegisterAdminController registerAdminController =
      Get.put(RegisterAdminController());
  var token = GetStorage().read('token');

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: customTheme,
      defaultTransition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 200),
      debugShowCheckedModeBanner: false,
      initialRoute: token == null ? '/register_user' : '/home_admin',
      getPages: [
        GetPage(name: '/home_user', page: () => HomeUserScreen()),
        GetPage(name: '/home_admin', page: () => HomeAdminScreen()),
        GetPage(name: '/register_user', page: () => RegisterUserScreen()),
        GetPage(name: '/register_admin', page: () => RegisterAdminScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),
      ],
    );
  }
}

ThemeData customTheme = ThemeData(
  textTheme: TextTheme().copyWith(
    headlineLarge: GoogleFonts.lexend(
      textStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 48,
      ),
    ),
    bodyMedium: GoogleFonts.lexend(
      textStyle: TextStyle(
        fontSize: 18,
      ),
    ),
    bodySmall: GoogleFonts.lexend(
      textStyle: TextStyle(
        fontSize: 16,
      ),
    ),
    labelSmall: GoogleFonts.lexend(
      textStyle: TextStyle(
        fontSize: 14,
      ),
    ),
  ),
);
