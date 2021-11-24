import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Obx(() {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: ClipOval(
                clipBehavior: Clip.antiAlias,
                child: Image.network(
                  controller.userData.value?.imageUrl ?? 'https://doutoresdoexcel.com.br/wp-content/uploads/2021/07/Loading-PNG.gif',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              controller.userData.value?.name ?? '',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: controller.logoutWithGoogle,
              child: const Text('Logout'),
            ),
          ],
        );
      })),
    );
  }
}
