import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:pill_cart/models/categories_model.dart';
import 'package:pill_cart/models/medicines_model.dart';
import 'package:pill_cart/utils/api_endpoints.dart';
import 'package:pill_cart/widgets/custom_snackbar.dart';

class CustomSearchController extends GetxController {
  List<Categories> categories = [];
  List<Medicines> searchResults = [];

  search(String key) async {
    if (key != null) {
      try {
        var token = GetStorage().read('token');
        http.Response response = await http.get(
          Uri.parse(baseUrl + 'search/$key'),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        );
        print('2');
        searchResults = medicinesFromJson(response.body);
        update();
        print(searchResults);
        if (response.statusCode == 200) {
        } else {
          print(response.body);
        }
      } catch (e) {
        print(e);
      }
    } 
  }
}
