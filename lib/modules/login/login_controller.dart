import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/route_manager.dart';
import 'package:login_social/application/ui/loader/loader_mixin.dart';
import 'package:login_social/application/ui/messages/messages_mixin.dart';
import 'package:login_social/services/login_service.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final LoginService _loginService;
  final loading = false.obs;
  final message = Rxn<MessageModel>();

  LoginController({
    required LoginService loginService,
  }) : _loginService = loginService;

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
  }

  Future<void> login() async {
    try {
      loading(true);
      await _loginService.loginWithGoogle();
      loading(false);
      Get.offAllNamed('/home');
      message(MessageModel(title: 'Sucesso', message: 'Sucesso ao efetuar login com google', type: MessageType.info));
    } catch (e) {
      loading(false);
      message(MessageModel.error(title: 'Falhou', message: 'Falha ao efetuar login com google'));
    }
  }
}
