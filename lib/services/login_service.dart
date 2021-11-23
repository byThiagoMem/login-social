import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginService {
  Future<UserCredential> loginWithGoogle();

  Future<void> logoutWithGoogle();
}
