//import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pill_cart/controller/register_user_controller.dart';
import 'package:pill_cart/controller/search_controller.dart';
import 'package:pill_cart/helper/constant.dart';
import 'package:pill_cart/main.dart';
import 'package:pill_cart/models/medicines_model.dart';
import 'package:pill_cart/widgets/custom_drawer.dart';
import 'package:pill_cart/widgets/text_fields/custom_search_bar.dart';
import 'package:pill_cart/widgets/text_fields/custom_text_form_field.dart';

class HomeUserScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();
  RegisterUserController registerUserController = Get.find();
  CustomSearchController customSearchController = Get.find();
  final String? firstName =
      GetStorage().read('firstName').toString().capitalizeFirst ?? '';
  HomeUserScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
          drawerScrimColor: Colors.black.withOpacity(0.7),
          endDrawer: CustomDrawer(),
          appBar: AppBar(
            centerTitle: false,
            leadingWidth: 48,
            titleSpacing: 16,
            foregroundColor: kBrand800,
            title: firstName != 'Null'
                ? Text('Hi, Doctor $firstName')
                : Text('Hi, Doctor'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Column(
                children: [
                  CustomSearchBar(
                    onChanged: (value) {
                      customSearchController.search(value);
                    },
                    controller: customSearchController,
                    onTapOutside: (p0) {},
                    isScure: true,
                    textController: searchController,
                    isSuffix: true,
                    preIcon: FontAwesomeIcons.magnifyingGlass,
                    isPrefix: true,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(15)),
                        ),
                        onPressed: () {
                          registerUserController.logout_user();
                        },
                        child: Text(
                          //registerUserController.user!.firstName ?? 'null',
                          //GetStorage().read('token'),
                          'Logout',
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(15)),
                        ),
                        onPressed: () {
                          customSearchController.search('tes');
                        },
                        child: Text(
                          //registerUserController.user!.firstName ?? 'null',
                          //GetStorage().read('token'),
                          'Search',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
} /* */
