import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'package:pill_cart/controller/HomePageController.dart';
import 'package:pill_cart/models/medicines_model.dart';

import 'package:pill_cart/widgets/card.dart';

class HomePage extends GetView<HomePageController> {
  // HomePageController homePageController = Get.find();
  HomePageController homePageController = Get.find();
  @override
  Widget build(BuildContext context) {
    homePageController.getdrugs();

    List<Medicines> medicins = homePageController.medicines;
    return Scaffold(
        // body:

        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Hi dr ',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(children: [
              SearchBar(
                trailing: [Icon(Icons.search)],
                hintText: "searh",
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "cartigories",
                    style: TextStyle(fontSize: 20),
                  ),
                  GestureDetector(
                    child: Icon(Icons.arrow_circle_right),
                    // onTap: () => Get.to(catigory()),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 70,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: Color.fromARGB(255, 144, 219, 222)),
                            height: 50,
                            width: 70,
                          ));
                    }),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "In Stock",
                    style: TextStyle(fontSize: 20),
                  ),
                  Icon(Icons.arrow_circle_right)
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                height: 500,
                child: Obx(
                  () {
                    return homePageController.isLoading.value == true
                        ? Center(child: CircularProgressIndicator())
                        : Container(
                            height: 500,
                            child: ListView.builder(
                                itemCount: medicins.length,
                                itemBuilder: (context, index) {
                                  return DrugCard(medicine: medicins[index]);
                                }),
                          );
                  },
                ),
              ),
            ])));
  }
}

/*
ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        print('hi');
                      },
                    ),
*/
