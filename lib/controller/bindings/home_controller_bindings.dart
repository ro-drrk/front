import 'package:get/get.dart';
import 'package:pill_cart/controller/register_user_controller.dart';
import 'package:pill_cart/controller/search_controller.dart';

class HomeControllerBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<CustomSearchController>(CustomSearchController(), permanent: true);
    Get.lazyPut<RegisterUserController>(() => RegisterUserController());
  }
}
