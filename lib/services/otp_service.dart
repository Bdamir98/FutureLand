import 'package:firebase_auth/firebase_auth.dart';

class OptService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  // phone number verification
  static Future<void> verifyPhoneNumber(String phoneNumber,
      Function(String vId) codeSent, Function(String errorMsg) onError) async {
    await _auth.verifyPhoneNumber(
      timeout: const Duration(seconds: 60),
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {
        print('phone number verified');
        print('phone number verified: ${credential}');
      },
      verificationFailed: (FirebaseAuthException e) {
        print('verification failed: $e');
        onError(e.message!);
      },
      codeSent: (String verificationId, int? resendToken) {
        print('verify id sent: $verificationId');
        codeSent(verificationId);
        // vId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );

    // return vId;
  }

  static Future<bool> matchingSmsCode(String vId, String smsCode) async {
    try {
      final PhoneAuthCredential credential =
          PhoneAuthProvider.credential(verificationId: vId, smsCode: smsCode);

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      print('credential have: $credential');
      print('user credential have: $userCredential');
      return userCredential.user != null ? true : false;
    } catch (error) {
      print('Wrong OTP');
      return false;
    }
  }
}