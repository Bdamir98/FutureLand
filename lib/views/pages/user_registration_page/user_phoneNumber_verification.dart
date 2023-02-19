import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_land/provider/otp_provider.dart';
import 'package:home_land/utils/constant.dart';
import 'package:home_land/views/pages/user_registration_page/user_view_information.dart';
import 'package:home_land/views/widgets/custom_button.dart';
import 'package:home_land/views/widgets/custom_text_field.dart';
import 'package:home_land/views/widgets/custom_toast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class UserphoneNumberVerify extends StatelessWidget {
  final Map<String, dynamic> nidSnapshot;
  final TextEditingController phonenumberCtrl = TextEditingController();
  UserphoneNumberVerify({super.key, required this.nidSnapshot});

  @override
  Widget build(BuildContext context) {
    String countryCode = '+880';
    phonenumberCtrl.text = countryCode + phonenumberCtrl.text;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
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
                controller: phonenumberCtrl,
                textLines: 1,
              ),
              SizedBox(
                height: 30,
              ),
              CustomButton(
                buONpress: () {
                  showLoadingDialog(context);
                  otpDialog(context, phonenumberCtrl.text.trim());
                },
                buttonTitle: 'Generate OTP',
              ),
            ],
          ),
        ),
      ),
    );
  }

  void otpDialog(
    BuildContext context,
    String phoneNumber,
  ) async {
    context.read<OtpProvider>().verifyPhoneNumber(phoneNumber, (vId) {
      // stopping loading dialog
      Navigator.pop(context);

      //showing otp dialog
      showOtpDialog(context, vId);
    }, (errorMsg) {
      messageToast(context, errorMsg);
      Navigator.pop(context);
    });
  }

  void showOtpDialog(BuildContext context, String vId) {
    final codeController = TextEditingController();
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: const EdgeInsets.all(8),
        content: Consumer<OtpProvider>(
          builder: (context, provider, child) => PinCodeTextField(
            appContext: context,
            length: 6,
            obscureText: false,
            animationType: AnimationType.fade,

            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(30),
              fieldHeight: 50,
              fieldWidth: 40,
              activeFillColor: Colors.white,
            ),
            animationDuration: const Duration(milliseconds: 300),
            // backgroundColor: Colors.blue.shade50,
            // enableActiveFill: true,
            //errorAnimationController: errorController,
            controller: codeController,
            onCompleted: (v) async {
              print("Completed");
              try {
                showLoadingDialog(context);
                bool otpVerified =
                    await provider.matchingSmsCode(vId, codeController.text);
                print('otp verified: $otpVerified');
                if (otpVerified) {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          NidCardResultView(nidSnapshot: nidSnapshot),
                    ),
                  );
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => HomeScreen(),
                  // ),);
                } else {
                  Navigator.pop(context);
                  messageToast(context, 'Wrong OTP');
                }
              } catch (error) {
                print('otpDialog error: $error');
                Navigator.pop(context);
              }
            },
            onChanged: (value) {
              print('onchanged: $value');
            },
            beforeTextPaste: (text) {
              print("Allowing to paste $text");
              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
              //but you can show anything you want here, like your pop up saying wrong paste format or etc
              return true;
            },
          ),
        ),
      ),
    );
  }
}
