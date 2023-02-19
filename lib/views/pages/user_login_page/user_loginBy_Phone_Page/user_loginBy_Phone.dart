import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:home_land/provider/user_provider.dart';
import 'package:home_land/views/screens/home_screen/home_screen.dart';
import 'package:home_land/views/widgets/custom_button.dart';
import 'package:home_land/views/widgets/custom_text_field.dart';
import 'package:home_land/views/widgets/custom_toast.dart';
import 'package:home_land/views/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

class UserLoginByPhone extends StatelessWidget {
  UserLoginByPhone({super.key});
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final isBool = true;
  @override
  Widget build(BuildContext context) {
    String countryCode = '+880';
    phoneController.text = countryCode + phoneController.text;

    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        children: [
          CustomFormField(
            hintText: 'Phone Number',
            keyboard: TextInputType.phone,
            controller: phoneController,
            textLines: 1,
          ),
          CustomFormField(
            hintText: 'Password',
            controller: passwordController,
            textLines: 1,
            obseceureText: true,
            icons: Icons.visibility_off,
          ),
          SizedBox(
            height: 30,
          ),
          Consumer<UserProvider>(
            builder: (context, value, child) {
              return CustomButton(
                buONpress: () async {
                  showLoadingDialog(context);
                  if (passwordController.text.isNotEmpty &&
                      phoneController.text.isNotEmpty) {
                    final userData =
                        await value.userinfoByPhone(phoneController.text);
                    if (value.userData != null) {
                      final email = value.userData!['Email'];
                      signInUser(context, email, passwordController.text);
                    } else {
                      contextMessageToast('Invalid Phone Number');
                    }
                  } else {
                    contextMessageToast('Enter Your Phone Number and Password');
                  }
                },
                buttonTitle: 'Login',
              );
            },
          )
        ],
      ),
    );
  }

  void signInUser(BuildContext context, String email, String password) async {
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
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
        }
      } on FirebaseAuthException catch (ex) {
        if (ex.code == 'user-not-found') {
          contextMessageToast('Invalid Phone Number');
        } else if (ex.code == 'wrong-password') {
          contextMessageToast('Password Is Incorrect');
        }
      }
    }
  }
}
