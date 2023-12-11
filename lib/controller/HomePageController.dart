import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import 'package:pill_cart/models/medicines_model.dart';

class HomePageController extends GetxController {
  List<Medicines> medicines = [];
  RxBool isLoading = true.obs;

  getdrugs() async {
    try {
      isLoading(true);
      //  print('1');
      http.Response response =
          await http.get(Uri.parse('http://10.0.2.2:8000/api/index'));
      // print(response.body);
      //  print(response.body.runtimeType);

      if (response.statusCode == 200) {
        medicines = medicinesFromJson(response.body);
      } else {
        print("no");
      }
      isLoading.value = false;
      //isLoading.value = !isLoading.value;
      //  print(medicines[0].toJson());
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  @override
  // TODO: implement onInit
  void get onInit {
    print('object');
    // isLoading = false;
    //load();
  }
}
