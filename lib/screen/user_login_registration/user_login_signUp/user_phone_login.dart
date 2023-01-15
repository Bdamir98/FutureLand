import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_land/constant.dart';
import 'package:home_land/custom_widget/custom_button.dart';
import 'package:home_land/custom_widget/custom_text_field.dart';

import 'user_login_phoneOtp.dart';

class UserPhoneLogin extends StatelessWidget {
  UserPhoneLogin({super.key});
  TextEditingController Phonenumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String countryCode = '+880';
    Phonenumber.text = countryCode + Phonenumber.text;
    return AuthFlowBuilder<PhoneAuthController>(
      builder: (context, state, ctrl, child) {
        if (state is AwaitingPhoneNumber) {
          return Column(
            children: [
              CustomFormField(
                hintText: 'Phone Number',
                keyboard: TextInputType.phone,
                controller: Phonenumber,
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                buttonTitle: 'Send OTP',
                buONpress: () {
                  ctrl.acceptPhoneNumber(Phonenumber.text);
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        UserLoginPhoneOTP(reSendOTP: Phonenumber.text),
                  ));
                },
              ),
            ],
          );
        } else
          return Container();
      },
    );
  }
}
