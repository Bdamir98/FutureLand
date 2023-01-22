import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:home_land/custom_widget/custom_button.dart';
import 'package:home_land/custom_widget/custom_text_field.dart';
import 'package:home_land/custom_widget/custom_toast.dart';
import 'package:home_land/screen/drawer_item_page/home_page/home_page.dart';
import 'package:home_land/services/auth_services.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  final TextEditingController phone = TextEditingController();
  final TextEditingController passwords = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: AuthFlowBuilder<PhoneAuthController>(
        builder: (context, state, ctrl, child) {
      if (state is AwaitingPhoneNumber) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomFormField(
              hintText: 'Phone Number',
              controller: phone,
            ),
            CustomFormField(
              hintText: 'Password',
              controller: passwords,
            ),
            CustomButton(
              buttonTitle: 'Send OTP',
              buONpress: () async {
                final userdata = await AuthService.getDataUsingPhone();
                print(userdata);

                if (userdata != null) {
                  final documentData = await AuthService.getDataUsingDocumentId('Users',
                      userdata.toString());
                  String emails = documentData['Email'].toString();
                  // ctrl.acceptPhoneNumber(phone.text);
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => AuthGatesNew(),
                  //   ),
                  // );

                  print(emails);
                  //signInUser(context, passwords, emails);
                  messageToast(context, 'Data Found');
                } else {
                  messageToast(context, 'Data not Found');
                }
              },
            )
          ],
        );
      } else {
        return Container();
      }
    }));
  }

  void signInUser(BuildContext context, TextEditingController password,
      String emails) async {
    String email = emails;
    String password = passwords.text.trim();

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      }
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'user-not-found') {
        contextMessageToast('Invalid Email');
      } else if (ex.code == 'wrong-password') {
        contextMessageToast('Password Is Incorrect');
      }
    }
  }
}
