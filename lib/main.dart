import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pill_cart/screens/home_screen.dart';
import 'package:pill_cart/screens/login_screen.dart';
import 'package:pill_cart/screens/register_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/register',
      getPages: [
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/register', page: () => RegisterScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),
      ],
    );
  }
}
