import 'package:login_social/modules/models/user_model.dart';

abstract class LoginRepository {
  Future<UserModel> loginWithGoogle();
  Future<void> logoutWithGoogle();

  Future<UserModel> loginWithFacebook();
  Future<void> logoutWithFacebook();
}
