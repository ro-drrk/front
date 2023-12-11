import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:pill_cart/models/medicines_model.dart';

class HomePageController extends GetxController {
  List<Medicines> medicines = [];
  RxBool isLoading = true.obs;

  getdrugs() async {
    try {
      //  print('1');
      http.Response response =
          await http.get(Uri.parse('http://127.0.0.1:8000/api/index'));
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
    }
  }

 @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}