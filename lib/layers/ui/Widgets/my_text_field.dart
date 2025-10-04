import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final void Function(String)? onChanged;

  const MyTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    @required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    @required this.prefixIcon,
    @required this.suffixIcon,
    @required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white),
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon)
            : null,
        suffixIcon: suffixIcon != null
            ? Icon(suffixIcon)
            : null,
        filled: true,
        fillColor: Colors.grey,
        contentPadding:
            const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 20,
            ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(60),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
