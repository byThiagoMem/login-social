import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:login_social/modules/home/home_controller.dart';

class CustomAppBar extends PreferredSize {
  CustomAppBar({Key? key, required HomeController controller, required VoidCallback onTap})
      : super(
          key: key,
          preferredSize: Size(Get.width, Get.height * .25),
          child: Obx(
            () {
              return Stack(
                children: [
                  Image.asset(
                    'assets/images/background_app_bar.png',
                    fit: BoxFit.fill,
                    width: Get.width,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: Get.height * .08),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: ClipOval(
                                clipBehavior: Clip.antiAlias,
                                child: controller.userData.value != null
                                    ? Image.network(
                                        controller.userData.value!.imageUrl,
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset('assets/images/avatar_logo.png'),
                              ),
                            ),
                            const SizedBox(height: 10),
                            RichText(
                              text: TextSpan(
                                text: 'Olá, ',
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                    text: controller.userData.value?.name ?? "usuário",
                                    style: const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: onTap,
                          child: Row(
                            children: const [
                              Text(
                                'Sair',
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(width: 10),
                              Icon(Icons.logout),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        );
}
