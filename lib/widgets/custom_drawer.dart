import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pill_cart/helper/constant.dart';
import 'package:pill_cart/main.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Material(
      elevation: 48,
      clipBehavior: Clip.antiAlias,
      shadowColor: kBrand100,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
              bottomStart: Radius.circular(40), topStart: Radius.circular(40))),
      child: Drawer(
        backgroundColor: kBrand100,
        width: width * 0.65,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              DrawerHeader(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8,
                      color: Colors.black.withOpacity(0.1),
                    )
                  ],
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage('assets/images/App logo.png'),
                          height: 48,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Pill Cart',
                          style: customLightTheme.textTheme.headlineLarge
                              ?.copyWith(
                            wordSpacing: 0.1,
                            color: kBrand500,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                        Get.toNamed('/account_settings');
                      },
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: kBrand900,
                            radius: 24,
                            child: Text("RM",
                                style: customLightTheme.textTheme.bodyLarge
                                    ?.copyWith(
                                  fontFamily:
                                      Get.currentRoute == '/account_settings'
                                          ? 'Lexend_Bold'
                                          : null,
                                  color: kBrand100,
                                )),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hi, Doctor",
                                style: customLightTheme.textTheme.labelSmall,
                              ),
                              Text(
                                "Rony Mansor",
                                style: customLightTheme.textTheme.headlineSmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                tileColor: Get.currentRoute == '/order_history'
                    ? kBrand900
                    : Colors.transparent,
                horizontalTitleGap: 0,
                contentPadding: Get.currentRoute == '/order_history'
                    ? EdgeInsets.symmetric(horizontal: 24)
                    : EdgeInsets.symmetric(horizontal: 16),
                leading: Icon(
                  Icons.inventory,
                  size: Get.currentRoute == '/order_history' ? 30 : 24,
                  color: Get.currentRoute == '/order_history'
                      ? kBrand100
                      : kBrand900,
                ),
                title: Text(
                  'Orders History',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Get.currentRoute == '/order_history'
                      ? customLightTheme.textTheme.titleLarge?.copyWith(
                          color: kBrand100,
                        )
                      : customLightTheme.textTheme.titleSmall?.copyWith(
                          color: kBrand900,
                        ),
                ),
                onTap: () => navigate(0),
              ),
              ListTile(
                tileColor: Get.currentRoute == '/settings'
                    ? kBrand900
                    : Colors.transparent,
                horizontalTitleGap: 0,
                contentPadding: Get.currentRoute == '/settings'
                    ? EdgeInsets.symmetric(horizontal: 24)
                    : EdgeInsets.symmetric(horizontal: 16),
                leading: Icon(
                  Icons.settings,
                  size: Get.currentRoute == '/settings' ? 30 : 24,
                  color:
                      Get.currentRoute == '/settings' ? kBrand100 : kBrand900,
                ),
                title: Text(
                  'Settings',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Get.currentRoute == '/settings'
                      ? customLightTheme.textTheme.titleLarge?.copyWith(
                          color: kBrand100,
                        )
                      : customLightTheme.textTheme.titleSmall?.copyWith(
                          color: kBrand900,
                        ),
                ),
                onTap: () => navigate(1),
              ),
              ListTile(
                tileColor: Get.currentRoute == '/about_us'
                    ? kBrand900
                    : Colors.transparent,
                horizontalTitleGap: 0,
                contentPadding: Get.currentRoute == '/about_us'
                    ? EdgeInsets.symmetric(horizontal: 24)
                    : EdgeInsets.symmetric(horizontal: 16),
                leading: Icon(
                  Icons.info,
                  size: Get.currentRoute == '/about_us' ? 30 : 24,
                  color:
                      Get.currentRoute == '/about_us' ? kBrand100 : kBrand900,
                ),
                title: Text(
                  'About Us',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Get.currentRoute == '/about_us'
                      ? customLightTheme.textTheme.titleLarge?.copyWith(
                          color: kBrand100,
                        )
                      : customLightTheme.textTheme.titleSmall?.copyWith(
                          color: kBrand900,
                        ),
                ),
                onTap: () => navigate(2),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('version: 1.0.0',
                    style: customLightTheme.textTheme.labelLarge
                        ?.copyWith(color: kBrand900)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  navigate(int index) {
    if (index == 0) {
      Get.back();
      Get.toNamed('/order_history');
    } else if (index == 1) {
      Get.back();
      Get.toNamed('/settings');
    } else if (index == 2) {
      Get.back();
      Get.toNamed('/about_us');
    }
  }
}
