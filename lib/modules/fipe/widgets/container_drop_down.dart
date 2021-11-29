import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerDropDown extends StatelessWidget {
  final String dropDownValueSelected;
  final bool enable;

  Color get borderColor => enable ? Colors.black : Colors.grey;

  const ContainerDropDown({Key? key, required this.dropDownValueSelected, required this.enable}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: Get.height * .06,
      width: Get.width * .9,
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: borderColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(dropDownValueSelected),
          Icon(Icons.arrow_drop_down, color: borderColor),
        ],
      ),
    );
  }
}
