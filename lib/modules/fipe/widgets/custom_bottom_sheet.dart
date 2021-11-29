import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_social/modules/fipe/fipe_controller.dart';
import 'package:login_social/modules/fipe/widgets/custom_form_field.dart';

enum DropDownChanged { monthReference, vehicleMake, vehicleModels }

class CustomBottomSheet {
  static void showCustomBottomSheet({
    required BuildContext context,
    required List<dynamic> data,
    required DropDownChanged dropDownChanged,
    required FipeController controller,
  }) {
    showModalBottomSheet(
      enableDrag: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                color: Colors.red[100],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Expanded(
                      child: CustomFormField(),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.red[50],
              height: Get.height * .45,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      dropDownChanged == DropDownChanged.monthReference
                          ? data[index].month
                          : dropDownChanged == DropDownChanged.vehicleMake
                              ? data[index].label
                              : dropDownChanged == DropDownChanged.vehicleModels
                                  ? data[index].label
                                  : '',
                      textAlign: TextAlign.center,
                    ),
                    onTap: () => dropDownChanged == DropDownChanged.monthReference
                        ? controller.toggleValuesDropDownReferenceTable(cod: data[index].cod, label: data[index].month)
                        : dropDownChanged == DropDownChanged.vehicleMake
                            ? controller.toggleValuesDropDownMarca(cod: data[index].value, label: data[index].label)
                            : dropDownChanged == DropDownChanged.vehicleModels
                                ? controller.toggleValuesDropDownModels(cod: data[index].value.toString(), label: data[index].label)
                                : null,
                  );
                },
                itemCount: data.length,
                separatorBuilder: (_, __) {
                  return Container(
                    height: .5,
                    color: Colors.grey,
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
