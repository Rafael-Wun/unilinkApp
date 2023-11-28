import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool? obsecureText;
  final bool? border;
  final double? borderRadius;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.keyboardType,
    this.obsecureText,
    this.border,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obsecureText != null ? true : false,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        border: OutlineInputBorder(
          borderRadius: borderRadius == true
              ? BorderRadius.circular(borderRadius!)
              : BorderRadius.circular(12.0),
          borderSide: border == true ? BorderSide() : BorderSide.none,
        ),
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
      ),
    );
  }
}
