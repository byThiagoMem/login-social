import 'package:login_social/models/user_model.dart';

abstract class LoginService {
  Future<UserModel> loginWithGoogle();
  Future<void> logoutWithGoogle();

  Future<UserModel> loginWithFacebook();
  Future<void> logoutWithFacebook();
}
