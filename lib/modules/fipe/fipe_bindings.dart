import 'package:get/instance_manager.dart';
import 'package:login_social/modules/fipe/fipe_controller.dart';
import 'package:login_social/repositories/fipe/fipe_repository.dart';
import 'package:login_social/repositories/fipe/fipe_repository_impl.dart';
import 'package:login_social/services/fipe/fipe_service.dart';
import 'package:login_social/services/fipe/fipe_service_impl.dart';

class FipeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FipeController>(() => FipeController(fipeService: Get.find()));
    Get.lazyPut<FipeService>(() => FipeServiceImpl(fipeRepository: Get.find()));
    Get.lazyPut<FipeRepository>(() => FipeRepositoryImpl(restClient: Get.find()));
  }
}
