import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_land/constant.dart';
import 'package:home_land/custom_widget/custom_button.dart';
import 'package:home_land/custom_widget/custom_text_field.dart';
import 'package:home_land/custom_widget/custom_toast.dart';
import 'package:home_land/screen/user_login_registration/otp_code_verification.dart';

class UserphoneNumberVerify extends StatelessWidget {
  final Map<String, dynamic> nidSnapshot;
  final TextEditingController Phonenumber = TextEditingController();
  UserphoneNumberVerify({super.key, required this.nidSnapshot});

  @override
  Widget build(BuildContext context) {
    String countryCode = '+880';
    Phonenumber.text = countryCode + Phonenumber.text;
    return Scaffold(
      body: SingleChildScrollView(
        child: AuthFlowBuilder<PhoneAuthController>(
          builder: (context, state, ctrl, child) {
            if (state is AwaitingPhoneNumber) {
              return Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  children: [
                    Container(
                      height: 250,
                      width: 250,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/otp_send.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Add Your Phone Number',
                      style: GoogleFonts.nunito(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: canvasColor),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Add your phone number in order to\nsend you your OTP security code',
                      style: GoogleFonts.roboto(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    CustomFormField(
                      hintText: 'Phone Number',
                      keyboard: TextInputType.phone,
                      controller: Phonenumber,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomButton(
                      buONpress: () {
                        if (nidSnapshot['Phone_Number'] ==
                            Phonenumber.text.toString()) {
                          ctrl.acceptPhoneNumber(Phonenumber.text);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  OtpCOdeVerification(nidSnapshot: nidSnapshot),
                            ),
                          );
                        } else {
                          messageToast(context, 'Phone Number Not Matched');
                        }
                      },
                      buttonTitle: 'Generate OTP',
                    ),
                  ],
                ),
              );
            } else
              return Container();
          },
        ),
      ),
    );
  }
}
