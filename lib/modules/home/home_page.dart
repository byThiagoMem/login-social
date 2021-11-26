import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:login_social/modules/home/widgets/custom_app_bar.dart';
import 'package:login_social/modules/home/widgets/custom_card.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        controller: controller,
        onTap: controller.logout,
      ),
      body: Container(
        width: Get.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomCard(
              consultType: ConsultType.car,
              onTap: () {},
            ),
            CustomCard(
              consultType: ConsultType.motorcycle,
              onTap: () {},
            ),
            CustomCard(
              consultType: ConsultType.truck,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
