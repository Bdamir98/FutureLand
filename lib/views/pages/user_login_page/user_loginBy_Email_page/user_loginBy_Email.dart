import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_land/provider/auth_provider.dart';
import 'package:home_land/provider/user_provider.dart';
import 'package:home_land/utils/constant.dart';
import 'package:home_land/views/pages/user_login_page/user_forget_password/user_forgot_password.dart';
import 'package:home_land/views/screens/home_screen/home_screen.dart';
import 'package:home_land/views/widgets/custom_button.dart';
import 'package:home_land/views/widgets/custom_text_field.dart';
import 'package:home_land/views/widgets/custom_toast.dart';
import 'package:provider/provider.dart';

class UserLoginByEmail extends StatelessWidget {
  UserLoginByEmail({super.key});

  final TextEditingController emailCtrl = TextEditingController();

  final TextEditingController passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final findUserEmail = Provider.of<UserProvider>(context);
    final passwordObscure = Provider.of<AuthProvider>(context);
    return Container(
        height: 250.h,
        child: Column(
          children: [
            CustomFormField(
              hintText: 'Email',
              controller: emailCtrl,
              textLines: 1,
            ),
            CustomFormField(
              hintText: 'Password',
              controller: passwordCtrl,
              obseceureText: true,
              textLines: 1,
              icons: Icons.visibility_off,
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
              height: 40.h,
            ),
            CustomButton(
              buttonTitle: 'Log In',
              buONpress: () async {
                //showLoadingDialog(context);
                signInUser(context);
                //await findUserEmail.userinfoByEmail(emailCtrl.text);
              },
            ),
          ],
        ));
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
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
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
