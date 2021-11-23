import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:login_social/application/modules/module.dart';
import 'package:login_social/modules/login/login_bindings.dart';
import 'package:login_social/modules/login/login_page.dart';

class LoginModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/login',
      page: () => const LoginPage(),
      binding: LoginBindings(),
    )
  ];
}
