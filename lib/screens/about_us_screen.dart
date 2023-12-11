import 'package:flutter/material.dart';
import 'package:pill_cart/helper/constant.dart';
import 'package:pill_cart/widgets/custom_drawer.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          titleSpacing: 0,
          foregroundColor: kBrand800,
          title: Text(
            'Hi, doctor',
          ),
        ),
        body: Center(
          child: Text(this.toString()),
        ),
      ),
    );
  }
}
