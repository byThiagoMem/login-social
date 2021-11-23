import 'package:get/instance_manager.dart';
import 'package:login_social/modules/login/login_controller.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(loginService: Get.find()));
  }
}
