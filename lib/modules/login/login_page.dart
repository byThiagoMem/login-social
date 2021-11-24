import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:login_social/modules/login/login_controller.dart';
import 'package:login_social/modules/login/widgets/social_button.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialButton(
              socialButtomType: SocialButtomType.google,
              onTap: () => controller.loginWithGoogle(),
            ),
            const SizedBox(height: 20),
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
