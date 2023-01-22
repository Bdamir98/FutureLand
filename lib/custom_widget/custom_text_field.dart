import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_land/constant.dart';

class CustomFormField extends StatelessWidget {
  CustomFormField(
      {Key? key,
      required this.hintText,
      this.inputFormatters,
      this.Valuename,
      this.valueCatch,
      this.validator,
      this.icon,
      this.icons,
      this.keyboard,
      this.onChanged,
      this.controller})
      : super(key: key);
  final IconData? icon;
  final IconData? icons;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboard;
  final String? Valuename, valueCatch;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: keyboard,
        onChanged: (value) {},
        controller: controller,
        inputFormatters: inputFormatters,
        validator: validator,
        cursorColor: Colors.white,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.transparent, width: 0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: canvasColor, width: 0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: purpleColor, width: 2),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          prefixIcon: Icon(
            icon,
            size: 30,
            color: Color.fromARGB(255, 67, 120, 235),
          ),
          suffixIcon: Icon(
            icons,
            size: 30,
            color: Colors.grey,
          ),
          filled: true,
          fillColor: Color(0xff2C2F52),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
