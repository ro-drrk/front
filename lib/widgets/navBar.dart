import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pill_cart/controller/NavBarController.dart';

import 'package:pill_cart/screens/homeScreen.dart';
import 'package:pill_cart/screens/search_result_scree.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavBarController());
    return GetBuilder<NavBarController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: [
              // HomePage(),
              SearchResultsScreen(),
              HomePage(),
              
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.red,
            onTap: controller.changeTabIndex,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            currentIndex: controller.tabIndex,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                  ),
                  label: 'searh'),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
              // BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'fav'),
            ]),
      );
    });
  }
}
