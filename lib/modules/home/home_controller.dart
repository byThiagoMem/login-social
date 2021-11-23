import 'package:get/get.dart';
import 'package:login_social/application/ui/loader/loader_mixin.dart';
import 'package:login_social/application/ui/messages/messages_mixin.dart';
import 'package:login_social/services/login_service.dart';

class HomeController extends GetxController with LoaderMixin, MessagesMixin {
  final LoginService _loginService;
  final message = Rxn<MessageModel>();

  HomeController({
    required LoginService loginService,
  }) : _loginService = loginService;

  Future<void> logout() async {
    try {
      _loginService.logoutWithGoogle();
      Get.offAllNamed('/login');
    } catch (e) {
      message(MessageModel.error(title: 'Falhou', message: 'Ocorreu uma falha ao fazer logout com o google'));
    }
  }
}
