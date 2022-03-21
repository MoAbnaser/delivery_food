import 'package:flutter/material.dart';
import 'package:food_delivery/utils/size_config.dart';

class AuthTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType? inputType;
  final Function validator;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final String hintText;

  const AuthTextFormField({
    required this.hintText,
    required this.prefixIcon,
    required this.validator,
    required this.obscureText,
    required this.controller,
    this.suffixIcon,
    this.inputType,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimensions.width20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(blurRadius: 10,spreadRadius: 7,offset: Offset(1,10),color: Colors.grey.withOpacity(0.2))
        ]
      ),
      child: TextFormField(
        style: const TextStyle(color: Colors.black),
        controller: controller,
        obscureText: obscureText,
        cursorColor: Colors.black,
        keyboardType: inputType,
        validator: (value) => validator(value),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white24),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white24),
            borderRadius: BorderRadius.circular(15),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white24),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white24),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
