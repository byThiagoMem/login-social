import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:login_social/application/modules/module.dart';
import 'package:login_social/modules/fipe/fipe_bindings.dart';

import 'fipe_page.dart';

class FipeModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/fipe',
      page: () => const FipePage(),
      binding: FipeBindings(),
    )
  ];
}
