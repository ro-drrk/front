import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pill_cart/models/categories_model.dart';
import 'package:pill_cart/models/medicines_model.dart';
import 'package:pill_cart/widgets/custom_snackbar.dart';

class MedicinesController extends GetxController {
  bool isValid = true;
  List<Medicines> medicines = [];
  List<Categories> categories = [];
  late TextEditingController tradeNameController,
      genericNameController,
      companyController,
      categoryController,
      priceController,
      amountController,
      expiringYearController,
      expiringMonthController;

  @override
  void get onInit {
    

    tradeNameController = TextEditingController();
    genericNameController = TextEditingController();
    companyController = TextEditingController();
    categoryController = TextEditingController();
    priceController = TextEditingController();
    amountController = TextEditingController();
    expiringYearController = TextEditingController();
    expiringMonthController = TextEditingController();
    
  }

  @override
  void onClose() {
    super.onClose();

    tradeNameController.dispose();
    genericNameController.dispose();
    companyController.dispose();
    categoryController.dispose();
    priceController.dispose();
    amountController.dispose();
    expiringYearController.dispose();
    expiringMonthController.dispose();
  }

  void validat() {
    if (tradeNameController.text == null ||
        genericNameController.text == null ||
        companyController.text == null ||
        categoryController.text == null ||
        priceController.text == null ||
        amountController.text == null ||
        expiringYearController.text == null ||
        expiringMonthController.text == null) {
      isValid = false;
      update();
    }
  }

  addMedicine() async {
    try {
      print('1');
      http.Response response = await http.post(
        Uri.parse('http://127.0.0.1:8000/api/store'),
        body: {
          'tradeName': tradeNameController.text,
          'genericName': genericNameController.text,
          'company': companyController.text,
          'category': categoryController.text,
          'price': priceController.text,
          'amount': amountController.text,
          'expiringYear': expiringYearController.text,
          'expiringMonth': expiringMonthController.text,
        },
        headers: {
          'Accept': 'application/json',
          // 'Content-Type': 'application/x-www-form-urlencoded',
        },
      );

      if (response.statusCode == 201) {
        print(response.body);
        customSnackbar("Done!", "Done.", "su");
      } else {
        print('error');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<List<Categories>> getAllCategory() async {
    try {
      print('1');
      http.Response response = await http.get(
        Uri.parse('http://127.0.0.1:8000/api/category'),
      );
      print(response.body);

      if (response.statusCode == 200) {
        categories = categoriesFromJson(response.body);
        for (int i = 0; i < categories.length; i++)
          print(categories.toList()[i].toJson());

        customSnackbar("done!", "Done.", "sy");
      } else {
        print('error');
      }
      return categories;
    } catch (e) {
      throw e;
    }
  }

  Future<List<Medicines>> getAllmedicines() async {
    try {
      print('1');
      http.Response response = await http.get(
        Uri.parse('http://127.0.0.1:8000/api/index'),
      );
      print('2');

      if (response.statusCode == 200) {
        medicines = medicinesFromJson(response.body);
        for (int i = 0; i < medicines.length; i++)
          print(medicines.toList()[i].toJson());

        customSnackbar("done!", "Done.", "sy");
      } else {
        print('error');
      }
      return medicines;
    } catch (e) {
      throw e;
    }
  }

  Future<List<Medicines>> search() async {
    try {
      print('1');
      http.Response response = await http.get(
        Uri.parse('http://127.0.0.1:8000/api/search/ald'),
      );
      print('2');

      if (response.statusCode == 200) {
        print('3');

        medicines = medicinesFromJson(response.body);
        for (int i = 0; i < medicines.length; i++)
          print(medicines.toList()[i].toJson());

        customSnackbar("Done!", "Done.", "su");
      } else {
        print('error');
        throw Exception();
      }
      return medicines;
    } catch (e) {
      throw e;
    }
  }
}
