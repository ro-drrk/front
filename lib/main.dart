import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pill_cart/controller/register_user_controller.dart';
import 'package:pill_cart/helper/constant.dart';
import 'package:pill_cart/screens/about_us_screen.dart';
import 'package:pill_cart/screens/account_settings_screen.dart';
import 'package:pill_cart/screens/home_user_screen.dart';
import 'package:pill_cart/screens/login_screen.dart';
import 'package:pill_cart/screens/order_history_scree.dart';
import 'package:pill_cart/screens/register_user_screen.dart';
import 'package:pill_cart/screens/settings_scree.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  // final RegisterUserController registerUserController =
  //     Get.put(RegisterUserController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: customLightTheme,
      defaultTransition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 200),
      debugShowCheckedModeBanner: false,

      initialRoute:
          GetStorage().read('token') == null ? '/register_user' : '/home_user',
      // initialRoute: '/home_user',
      getPages: [
        GetPage(name: '/home_user', page: () => HomeUserScreen()),
        GetPage(name: '/register_user', page: () => RegisterUserScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/order_history', page: () => OrderHistoryScreen()),
        GetPage(name: '/settings', page: () => SettingsScreen()),
        GetPage(name: '/about_us', page: () => AboutUsScreen()),
        GetPage(name: '/account_settings', page: () => AccountSettingsScreen()),
      ],
    );
  }
}

ThemeData customLightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'Lexend_Regular',
  appBarTheme: AppBarTheme(
    toolbarHeight: 56,
    backgroundColor: Colors.transparent,
    elevation: 0,
    titleTextStyle: TextStyle(
        fontFamily: 'Lexend_SemiBold', fontSize: 24, color: kBrand800),
  ),
  textTheme: const TextTheme().copyWith(
    //* displays
    displayLarge: TextStyle(
      fontFamily: 'Lexend_Bold',
      fontSize: 48,
    ),
    displayMedium: TextStyle(
      fontFamily: 'Lexend_Bold',
      fontSize: 42,
    ),
    displaySmall: TextStyle(
      fontFamily: 'Lexend_Bold',
      fontSize: 34,
    ),
    //* labels
    labelLarge: TextStyle(
      fontFamily: 'Lexend_SemiBold',
      fontSize: 18,
    ),
    labelMedium: TextStyle(
      fontSize: 16,
    ),
    labelSmall: TextStyle(
      fontSize: 14,
    ),
    //* body
    bodySmall: TextStyle(
      fontSize: 16,
    ),
    bodyMedium: TextStyle(
      fontSize: 18,
    ),
    bodyLarge: TextStyle(
      fontSize: 20,
    ),
    //* headline
    headlineSmall: TextStyle(
      fontFamily: 'Lexend_SemiBold',
      fontSize: 20,
    ),

    headlineLarge: TextStyle(
      fontFamily: 'Lexend_SemiBold',
      fontSize: 24,
    ),
    //* title
    titleSmall: TextStyle(
      fontFamily: 'Lexend_Bold',
      fontSize: 16,
    ),
    titleLarge: TextStyle(
      fontFamily: 'Lexend_Bold',
      fontSize: 18,
    ),
  ),
);
