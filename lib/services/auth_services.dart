import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // initializing firebase auth
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  // this function will return current user information
  static User? get user => _auth.currentUser;
  static Future<void> get reload => _auth.currentUser!.reload();

  static Future<bool> checkIsVerified() async {
    await reload;
    return user!.emailVerified;
  }
}
