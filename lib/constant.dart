import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

final purpleColor = Color(0xff6688FF);
final darkTextColor = Color(0xff1F1A3D);
final lightTextColor = Color(0xff999999);
final textFieldColor = Color(0xffF5F6FA);
final borderColor = Color(0xffD9D9D9);
const kHeadTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 24,
  fontWeight: FontWeight.bold,
);

const kHeadSubtitleTextStyle = TextStyle(
  fontSize: 18,
  color: Colors.black87,
);

showLoadingDialog(BuildContext context) {
  showCupertinoDialog(
    context: context,
    builder: (context) => SpinKitFadingCircle(
      color: Colors.white,
      size: 50.0,
    ),
  );
}

const primaryColor = Color.fromRGBO(104, 91, 255, 1);
const canvasColor = Color(0xff1D1E3A);
const scaffoldBackgroundColor = Color(0xff1D1E3A);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);

class Palette {
  static const Color iconColor = Color(0xFFB6C7D1);
  static const Color activeColor = Color(0xFF09126C);
  static const Color textColor1 = Color(0XFFA7BCC7);
  static const Color textColor2 = Color(0XFF9BB3C0);
  static const Color facebookColor = Color(0xFF3B5999);
  static const Color googleColor = Color(0xFFDE4B39);
  static const Color backgroundColor = Color(0xFFECF3F9);
}
