import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarFipe extends PreferredSize {
  final String title;
  final String image;

  AppBarFipe({Key? key, required this.title, required this.image})
      : super(
          key: key,
          preferredSize: Size(Get.width, Get.height * .08),
          child: AppBar(
            backgroundColor: Colors.red[50],
            iconTheme: const IconThemeData(color: Colors.black),
            title: Text(
              title,
              style: const TextStyle(color: Colors.black),
            ),
            actions: [
              Image.asset(
                image,
                width: Get.width * .22,
              ),
            ],
          ),
        );
}
