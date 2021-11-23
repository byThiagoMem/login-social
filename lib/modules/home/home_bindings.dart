import 'package:get/instance_manager.dart';
import 'package:login_social/modules/home/home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(loginService: Get.find()));
  }
}
