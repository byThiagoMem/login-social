import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_social/modules/fipe/fipe_controller.dart';
import 'package:login_social/modules/fipe/widgets/container_drop_down.dart';
import 'package:login_social/modules/fipe/widgets/custom_bottom_sheet.dart';

class CustomDropdownMonthReference extends GetView<FipeController> {
  final String title;
  final List<dynamic> data;
  final DropDownChanged dropDownChanged;
  final String dropDownValueSelected;
  final bool enable;
  const CustomDropdownMonthReference({
    required this.data,
    required this.title,
    required this.dropDownChanged,
    required this.dropDownValueSelected,
    required this.enable,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          InkWell(
            child: ContainerDropDown(
              dropDownValueSelected: dropDownValueSelected,
              enable: enable,
            ),
            onTap: enable
                ? () {
                    CustomBottomSheet.showCustomBottomSheet(
                      context: context,
                      data: data,
                      controller: controller,
                      dropDownChanged: dropDownChanged,
                    );
                  }
                : null,
          )
        ],
      ),
    );
  }
}
