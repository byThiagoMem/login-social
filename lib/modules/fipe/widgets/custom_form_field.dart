import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        icon: Icon(Icons.search, color: Colors.black45),
        border: InputBorder.none,
      ),
    );
  }
}
