import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:login_social/modules/login/login_controller.dart';
import 'package:login_social/modules/login/widgets/social_button.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 100),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffffffff),
              Color(0xff7d7d7d),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              child: Image.asset('assets/images/fipe_logo.png'),
              height: Get.size.width * .4,
            ),
            SizedBox(height: Get.size.height * .30),
            SocialButton(
              socialButtomType: SocialButtomType.email,
              onTap: () => controller.loginWithEmail(),
            ),
            SizedBox(height: Get.size.height * .02),
            SocialButton(
              socialButtomType: SocialButtomType.google,
              onTap: () => controller.loginWithGoogle(),
            ),
            SizedBox(height: Get.size.height * .02),
            SocialButton(
              socialButtomType: SocialButtomType.facebook,
              onTap: () => controller.loginWithFacebook(),
            ),
          ],
        ),
      ),
    );
  }
}
