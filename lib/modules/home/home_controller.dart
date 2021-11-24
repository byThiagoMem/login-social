import 'package:get/get.dart';
import 'package:login_social/application/ui/loader/loader_mixin.dart';
import 'package:login_social/application/ui/messages/messages_mixin.dart';
import 'package:login_social/modules/login/login_controller.dart';
import 'package:login_social/modules/models/user_model.dart';
import 'package:login_social/services/login_service.dart';

class HomeController extends GetxController with LoaderMixin, MessagesMixin {
  final LoginService _loginService;
  final message = Rxn<MessageModel>();
  Rxn<UserModel> userData = Rxn<UserModel>();
  Rxn<String> socialLoginType = Rxn<String>();

  HomeController({
    required LoginService loginService,
  }) : _loginService = loginService;

  @override
  void onReady() {
    super.onReady();
    socialLoginType.value = Get.parameters['type'];
    userData.value = Get.arguments;
  }

  Future<void> logoutWithGoogle() async {
    try {
      await _loginService.logoutWithGoogle();
      Get.offAllNamed('/login');
    } catch (e) {
      message(MessageModel.error(title: 'Falhou', message: 'Ocorreu uma falha ao fazer logout com o google'));
    }
  }

  Future<void> logoutWithFacebook() async {
    try {
      await _loginService.logoutWithFacebook();
      Get.offAllNamed('/login');
    } catch (e) {
      message(MessageModel.error(title: 'Falhou', message: 'Ocorreu uma falha ao fazer logout com o facebook'));
    }
  }

  Future<void> logout() async {
    if (socialLoginType.value == SOCIALLOGINTYPE.google.toString()) {
      await logoutWithGoogle();
    } else {
      await logoutWithFacebook();
    }
  }
}
