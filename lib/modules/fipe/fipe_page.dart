import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:login_social/modules/fipe/fipe_controller.dart';
import 'package:login_social/modules/fipe/widgets/app_bar_fipe.dart';
import 'package:login_social/modules/fipe/widgets/custom_bottom_sheet.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFipe(title: title, image: image),
      body: Obx(
        () {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomDropdownMonthReference(
                title: 'Período de referência',
                data: controller.tableReference,
                dropDownChanged: DropDownChanged.monthReference,
                dropDownValueSelected: controller.monthReferenceLabelSelected.value,
                enable: true,
              ),
              const SizedBox(height: 10),
              CustomDropdownMonthReference(
                title: 'Marca do veículo',
                data: controller.vehicleBrand,
                dropDownChanged: DropDownChanged.vehicleMake,
                dropDownValueSelected: controller.labelMarca.value,
                enable: true,
              ),
              const SizedBox(height: 10),
              CustomDropdownMonthReference(
                title: 'Modelo do veículo',
                data: controller.vehicleModels,
                dropDownChanged: DropDownChanged.vehicleModels,
                dropDownValueSelected: controller.labelModel.value,
                enable: controller.vehicleModels.isNotEmpty,
              ),
            ],
          );
        },
      ),
    );
  }
}
