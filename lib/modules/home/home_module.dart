import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:login_social/application/modules/module.dart';
import 'package:login_social/modules/home/home_bindings.dart';
import 'package:login_social/modules/home/home_page.dart';

class HomeModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/home',
      page: () => const HomePage(),
      binding: HomeBindings(),
    ),
  ];
}
