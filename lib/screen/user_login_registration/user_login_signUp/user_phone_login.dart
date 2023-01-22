import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:home_land/custom_widget/custom_button.dart';
import 'package:home_land/custom_widget/custom_text_field.dart';
import 'package:home_land/provider/firebase_database_provider.dart';
import 'package:provider/provider.dart';

class UserPhoneLogin extends StatelessWidget {
  final TextEditingController Phonenumber = TextEditingController();
  UserPhoneLogin({super.key});

  @override
  Widget build(BuildContext context) {
    // String countryCode = '+880';
    // Phonenumber.text = countryCode + Phonenumber.text;

    return AuthFlowBuilder<PhoneAuthController>(
      builder: (context, state, ctrl, child) {
        if (state is AwaitingPhoneNumber) {
          return Consumer<MyNidCardData>(
            builder: (context, value, child) {
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
                    buONpress: () async {
                      final userData =
                          await value.userinfoByPhone();
                      print(userData.toString());
                      // FutureBuilder(
                      //   future: AuthService.getUserByEmail(Phonenumber.text),
                      //   builder: (context, snapshot) {
                      //     print(Phonenumber.text);
                      //     if (snapshot.hasData) {
                      //       messageToast(context, 'Data Found');
                      //       print(snapshot.data!['Name']);
                      //     } else {
                      //       messageToast(context, 'Data Not Found');
                      //     }
                      //     return Text('data');
                      //   },
                      // );

                      // ctrl.acceptPhoneNumber(Phonenumber.text.toString());
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) =>
                      //         UserLoginPhoneOTP(reSendOTP: Phonenumber.text),
                      //   ),
                      // );
                    },
                  ),
                ],
              );
            },
          );
        } else
          return Container();
      },
    );
  }
}
