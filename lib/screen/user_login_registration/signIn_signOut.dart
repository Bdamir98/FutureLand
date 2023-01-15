import 'package:flutter/material.dart';

import 'package:home_land/constant.dart';

import 'package:home_land/screen/user_login_registration/user_login_signUp/user_email_login.dart';

import 'package:home_land/screen/user_login_registration/user_login_registration.dart';
import 'package:home_land/screen/user_login_registration/user_login_signUp/user_phone_login.dart';

class SignInAndSignOut extends StatefulWidget {
  SignInAndSignOut({Key? key}) : super(key: key);

  @override
  State<SignInAndSignOut> createState() => _SignInAndSignOutState();
}

class _SignInAndSignOutState extends State<SignInAndSignOut> {
  bool _isEmailSelected = true;
  bool _isPhoneSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/sign in .png',
                  height: 300,
                  width: 300,
                ),
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.blueGrey),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            _isEmailSelected = true;
                            _isPhoneSelected = false;
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 110,
                          decoration: BoxDecoration(
                            color: _isEmailSelected == true
                                ? canvasColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                              child: Text(
                            'Email',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _isPhoneSelected = true;
                            _isEmailSelected = false;
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 110,
                          decoration: BoxDecoration(
                            color: _isPhoneSelected == true
                                ? canvasColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                              child: Text(
                            'Phone',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                _isEmailSelected ? UserEmailLogin() : Container(),
                _isPhoneSelected ? UserPhoneLogin() : Container(),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't Have an Account?",
                      style: TextStyle(color: canvasColor),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => NidUserSearch(),
                        ));
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: purpleColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
