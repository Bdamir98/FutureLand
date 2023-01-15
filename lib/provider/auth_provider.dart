import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../services/auth_services.dart';

class AuthProvider extends ChangeNotifier {
  String? genderGroupValue;
  dynamic _value;
  dynamic get value => _value;
  String isFoundMsg = '';
  set value(dynamic newValue) {
    _value = newValue;
    notifyListeners();
  }

  // this method will return current user info
  User? getCurrentUser() => AuthService.user;

  Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
    notifyListeners();
  }

  void setGenderGroupValue(String value) {
    genderGroupValue = value;
    notifyListeners();
  }

  Future<bool> checkEmailVerification() async {
    return await AuthService.checkIsVerified();
  }
}
