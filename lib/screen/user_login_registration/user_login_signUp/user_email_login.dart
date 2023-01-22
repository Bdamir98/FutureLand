import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:home_land/constant.dart';
import 'package:home_land/custom_widget/custom_button.dart';
import 'package:home_land/custom_widget/custom_text_field.dart';
import 'package:home_land/custom_widget/custom_toast.dart';
import 'package:home_land/screen/user_login_registration/user_forgotPassword.dart';

class UserEmailLogin extends StatelessWidget {
 final TextEditingController emailCtrl = TextEditingController();
 final TextEditingController passwordCtrl = TextEditingController();
  UserEmailLogin({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomFormField(
          hintText: 'Email',
          controller: emailCtrl,
        ),
        CustomFormField(
          hintText: 'Password',
          controller: passwordCtrl,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UserForgotPassword(),
                ));
              },
              child: Text(
                'Forgot Password?',
                style: TextStyle(color: purpleColor),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        CustomButton(
          buttonTitle: 'Log In',
          buONpress: () {
            signInUser(context);
          },
        ),
      ],
    );
  }

  void signInUser(BuildContext context) async {
    String email = emailCtrl.text.trim();
    String password = passwordCtrl.text.trim();
    if (email.isEmpty && password.isEmpty) {
      contextMessageToast('Enter Your Email and Password');
    } else if (email.isEmpty) {
      contextMessageToast('Enter Your Email');
    } else if (password.isEmpty) {
      contextMessageToast('Enter Your Password');
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        if (userCredential.user != null) {
          Navigator.pop(context);
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
}
