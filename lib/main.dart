import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:login_social/application/bindings/application_binginds.dart';
import 'package:login_social/modules/home/home_module.dart';
import 'package:login_social/modules/login/login_module.dart';
import 'package:login_social/modules/login/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ApplicationBinginds(),
      getPages: [
        ...LoginModule().routers,
        ...HomeModule().routers,
      ],
      title: 'Flutter Social Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[800],
      ),
      home: const LoginPage(),
    );
  }
}
