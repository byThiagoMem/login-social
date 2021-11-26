import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:login_social/application/rest_client/rest_client.dart';
import 'package:login_social/modules/login/login_controller.dart';
import 'package:login_social/repositories/login/login_repository.dart';
import 'package:login_social/repositories/login/login_repository_impl.dart';
import 'package:login_social/services/login/login_service.dart';
import 'package:login_social/services/login/login_service_impl.dart';

class ApplicationBinginds implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(loginService: Get.find()));
    Get.lazyPut<LoginRepository>(() => LoginRepositoryImpl());
    Get.lazyPut<LoginService>(() => LoginServiceImpl(loginRepository: Get.find()));
    Get.lazyPut<RestClient>(() => RestClient(), fenix: true);
  }
}
