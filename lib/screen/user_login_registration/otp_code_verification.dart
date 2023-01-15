import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_land/constant.dart';
import 'package:home_land/custom_widget/custom_button.dart';
import 'package:home_land/custom_widget/custom_text_field.dart';
import 'package:home_land/screen/user_login_registration/user_view_information.dart';

class OtpCOdeVerification extends StatelessWidget {
  OtpCOdeVerification({super.key, required this.nidSnapshot});

  Map<String, dynamic> nidSnapshot;
  TextEditingController verificationCode = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: AuthFlowBuilder<PhoneAuthController>(
          builder: (context, state, controller, child) {
            return Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/otp_verify.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Enter Your OTP',
                    style: GoogleFonts.nunito(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'We have sent you an OTP for\nPhone Number Verification',
                    style: GoogleFonts.roboto(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  CustomFormField(
                    hintText: 'Enter your OTP here',
                    keyboard: TextInputType.number,
                    controller: verificationCode,
                  ),
                  InkWell(
                    onTap: () {
                      controller.acceptPhoneNumber(
                          nidSnapshot['Phone_Number'].toString());
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          'Resend OTP',
                          style: TextStyle(color: purpleColor),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                    buONpress: () {
                      controller
                          .verifySMSCode(verificationCode.text.toString());
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              NidCardResultView(nidSnapshot: nidSnapshot),
                        ),
                      );
                    },
                    buttonTitle: 'Verify OTP',
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
