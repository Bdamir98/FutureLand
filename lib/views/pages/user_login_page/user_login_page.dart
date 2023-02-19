import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_land/utils/constant.dart';
import 'package:home_land/views/pages/user_registration_page/user_registrationBy_Nid.dart';

import 'user_loginBy_Email_page/user_loginBy_Email.dart';
import 'user_loginBy_Phone_Page/user_loginBy_Phone.dart';

class UserLoginPage extends StatefulWidget {
  UserLoginPage({Key? key}) : super(key: key);

  @override
  State<UserLoginPage> createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  bool _isEmailSelected = true;
  bool _isPhoneSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 238, 237, 237)),
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: purpleColor,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Image.asset(
                  'assets/sign in .png',
                  height: 210.h,
                  width: 210.w,
                ),
                Container(
                  height: 50.h,
                  width: 250.w,
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
                          height: 40.h,
                          width: 110.w,
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
                          height: 40.h,
                          width: 110.w,
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
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                _isEmailSelected ? UserLoginByEmail() : Container(),
                _isPhoneSelected ? UserLoginByPhone() : Container(),
                SizedBox(
                  height: 20.h,
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
                          builder: (context) => UserRegistrationByNid(),
                        ));
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: purpleColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
