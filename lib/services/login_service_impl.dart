import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_social/repositories/login_repository.dart';

import 'login_service.dart';

class LoginServiceImpl implements LoginService {
  final LoginRepository _loginRepository;

  LoginServiceImpl({
    required LoginRepository loginRepository,
  }) : _loginRepository = loginRepository;

  @override
  Future<UserCredential> loginWithGoogle() => _loginRepository.loginWithGoogle();

  @override
  Future<void> logoutWithGoogle() => _loginRepository.logoutWithGoogle();
}
