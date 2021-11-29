import 'package:login_social/models/user_model.dart';
import 'package:login_social/repositories/login/login_repository.dart';

import 'login_service.dart';

class LoginServiceImpl implements LoginService {
  final LoginRepository _loginRepository;

  LoginServiceImpl({
    required LoginRepository loginRepository,
  }) : _loginRepository = loginRepository;

  @override
  Future<UserModel> loginWithGoogle() => _loginRepository.loginWithGoogle();

  @override
  Future<void> logoutWithGoogle() => _loginRepository.logoutWithGoogle();

  @override
  Future<UserModel> loginWithFacebook() => _loginRepository.loginWithFacebook();

  @override
  Future<void> logoutWithFacebook() => _loginRepository.logoutWithFacebook();
}
