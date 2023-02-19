import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:home_land/utils/constant.dart';

Future<void> messageToast(BuildContext context, String message) {
  return Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: purpleColor,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

Future<void> contextMessageToast(String message) {
  return Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: purpleColor,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
