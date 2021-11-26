import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_social/modules/models/user_model.dart';

import 'login/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<UserModel> loginWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser?.authentication;

    if (googleAuth != null) {
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);

      return UserModel(name: googleUser!.displayName!, imageUrl: googleUser.photoUrl!);
    }
    throw Exception('Erro ao realizar login com o Google');
  }

  @override
  Future<void> logoutWithGoogle() async {
    await GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
  }

  @override
  Future<UserModel> loginWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login(
      permissions: ['email', 'public_profile', 'user_birthday'],
    );

    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

    var userData = await FacebookAuth.instance.getUserData();

    return UserModel.fromMap(userData);
  }

  @override
  Future<void> logoutWithFacebook() async {
    await FacebookAuth.instance.logOut();
    FirebaseAuth.instance.signOut();
  }
}
