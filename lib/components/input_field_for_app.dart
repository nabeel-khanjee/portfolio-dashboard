import 'package:flutter/material.dart';
import 'package:flutter_profile/constants.dart';

class InputFieldApp extends StatelessWidget {
  const InputFieldApp({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.icon,
    required this.errorRes,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final String errorRes;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (val) {
        if (val == null || val.isEmpty) {
          return errorRes;
        }
      },
      decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: darkColor))),
    );
  }
}
