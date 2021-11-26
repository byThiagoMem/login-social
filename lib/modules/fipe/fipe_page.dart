import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:login_social/modules/fipe/fipe_controller.dart';
import 'package:login_social/modules/fipe/widgets/app_bar_fipe.dart';
import 'package:login_social/modules/fipe/widgets/custom_dropdown_month_reference.dart';
import 'package:login_social/modules/home/widgets/custom_card.dart';

class FipePage extends GetView<FipeController> {
  const FipePage({Key? key}) : super(key: key);

  String get title => Get.arguments == ConsultType.car
      ? 'Consultar carros'
      : Get.arguments == ConsultType.motorcycle
          ? 'Consultar motos'
          : 'Consultar caminhões';

  String get image => Get.arguments == ConsultType.car
      ? 'assets/images/carro.png'
      : Get.arguments == ConsultType.motorcycle
          ? 'assets/images/moto.png'
          : 'assets/images/caminhao.png';

  int get cod => Get.arguments == ConsultType.car
      ? 1
      : Get.arguments == ConsultType.motorcycle
          ? 2
          : 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFipe(title: title, image: image),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomDropdownMonthReference(
            title: 'Período de referência',
            futureBuilder: controller.getTableReference(),
            data: controller.tableReference,
          ),
        ],
      ),
    );
  }
}
