import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_land/utils/constant.dart';

class CustomFormField extends StatelessWidget {
  CustomFormField(
      {Key? key,
      this.hintText,
      this.inputFormatters,
      this.Valuename,
      this.valueCatch,
      this.validator,
      this.icon,
      this.icons,
      this.keyboard,
      this.onChanged,
      this.initValue,
      this.textLines,
      this.obseceureText = false,
      this.controller})
      : super(key: key);
  final IconData? icon;
  final IconData? icons;
  final String? hintText;
  final String? initValue;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboard;
  bool obseceureText;
  final String? Valuename, valueCatch;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final int? textLines;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        obscureText: obseceureText,
        keyboardType: keyboard,
        onChanged: (value) {},
        controller: controller,
        inputFormatters: inputFormatters,
        validator: validator,
        cursorColor: scaffoldBackgroundColor,
        maxLines: textLines,
        initialValue: initValue,
        style: TextStyle(color: scaffoldBackgroundColor),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:
                BorderSide(color: Color.fromARGB(255, 238, 237, 237), width: 0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:
                BorderSide(color: Color.fromARGB(255, 238, 237, 237), width: 0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.transparent, width: 0),
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
            color: scaffoldBackgroundColor,
          ),
          filled: true,
          fillColor: Color.fromARGB(255, 238, 237, 237),
          hintText: hintText,
          hintStyle: TextStyle(
            color: scaffoldBackgroundColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
