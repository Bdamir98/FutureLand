import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:home_land/services/auth/auth_service.dart';


class AuthProvider extends ChangeNotifier {
  bool isObscure = true;
  bool isVisible = false;
  bool isSignOut = false;
  String? name, email, password, imagePath, mobileNumber, district, division;

  String errorMessage = '';
  Timer? timer;
  int emailResendTime = 59;
  bool isEmailVerified = false, isMobileVerified = false;
  bool? ensureEmailVerified;
  String? vId;

  String? genderGroupValue;
  num? dob;

  // change visibility of password
  void changeVisibility() {
    isVisible = !isVisible;
    isObscure = !isObscure;
    notifyListeners();
  }

  void setGenderGroupValue(String value) {
    genderGroupValue = value;
    notifyListeners();
  }

  // reset section/*
  // all reset*/
  void resetTimerValue() {
    if (timer != null) {
      timer!.cancel();
    }
    emailResendTime = 59;
    notifyListeners();
  }

  // start timer
  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (emailResendTime > 0) {
        emailResendTime--;
        notifyListeners();
      } else {
        timer.cancel();
      }
    });
  }

  // stop timer
  void stopTimer() {
    timer!.cancel();
  }


  // checking email is verified or not
  Future<bool> checkEmailVerification() async {
    return await AuthService.checkIsVerified();
  }

// checking phone number verification. this method will return vId
  Future<void> verifyPhoneNumber(String phoneNumber,
      Function(String vId) codeSent, Function(String errorMsg) onError) async {
    await AuthService.verifyPhoneNumber(phoneNumber, codeSent, onError);
  }

  Future<bool> matchingSmsCode(String vId, String smsCode) async {
    try {
      if (await AuthService.matchingSmsCode(vId, smsCode)) {
        isMobileVerified = true;
        signOut();
        return true;
      } else {
        throw 'Wrong OTP';
      }
    } catch (error) {
      print('error at auth provider: $error');
      return false;
    }
  }

  // SignUp user with email verification
  Future<bool> emailVerification() async {
    try {
      if (await AuthService.emailVerification()) {
        return true;
      }
      throw 'Email not verified';
    } catch (error) {
      print(error);
      return false;
    }
  }
  // sign out
  Future<void> signOut() async {
    try {
      await AuthService.signOut();
      isSignOut = true;
      notifyListeners();
    } catch (error) {
      print('error sign out: $error');
    }
  }
  // this method will return current user info
  User? getCurrentUser() => AuthService.user;
}