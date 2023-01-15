import 'package:flutter/material.dart';
import 'package:home_land/constant.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, this.buttonTitle, this.buONpress});
  String? buttonTitle;
  VoidCallback? buONpress;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: TextButton(
        onPressed: buONpress,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(purpleColor),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            padding:
                MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 14)),
            textStyle: MaterialStateProperty.all(TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ))),
        child: Text('${buttonTitle}'),
      ),
    );
  }
}
