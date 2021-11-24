import 'package:login_social/application/ui/loader/loader_mixin.dart';
import 'package:login_social/application/ui/messages/messages_mixin.dart';
import 'package:login_social/services/login_service.dart';
import 'package:get/get.dart';

enum SOCIALLOGINTYPE { google, facebok }

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

  Future<void> loginWithGoogle() async {
    try {
      loading(true);
      var user = await _loginService.loginWithGoogle();
      loading(false);
      message(MessageModel(title: 'Sucesso', message: 'Sucesso ao efetuar login com google', type: MessageType.info));
      await Get.offAllNamed('/home', arguments: user, parameters: {'type': '${SOCIALLOGINTYPE.google}'});
    } catch (e) {
      Get.back();
      message(MessageModel.error(title: 'Falhou', message: 'Falha ao efetuar login com google'));
    }
  }

  Future<void> loginWithFacebook() async {
    try {
      loading(true);
      var user = await _loginService.loginWithFacebook();
      loading(false);
      message(MessageModel(title: 'Sucesso', message: 'Sucesso ao efetuar login com facebook', type: MessageType.info));
      await Get.offAllNamed("/home", arguments: user);
    } catch (_) {
      Get.back();
      message(MessageModel.error(title: 'Falhou', message: 'Falha ao efetuar login com facebook'));
    }
  }
}
