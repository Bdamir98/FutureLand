import 'package:flutter/foundation.dart';
import 'package:home_land/services/auth/auth_service.dart';
import 'package:home_land/services/otp_service.dart';

class OtpProvider extends ChangeNotifier {
  bool isSignOut = false;
  bool isMobileVerified = false;
  // checking phone number verification. this method will return vId
  Future<void> verifyPhoneNumber(String phoneNumber,
      Function(String vId) codeSent, Function(String errorMsg) onError) async {
    await OptService.verifyPhoneNumber(phoneNumber, codeSent, onError);
  }

  Future<bool> matchingSmsCode(String vId, String smsCode) async {
    try {
      if (await OptService.matchingSmsCode(vId, smsCode)) {
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
}
