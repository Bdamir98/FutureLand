import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserService {
  //Get Data From User Table Where Email field Value is user given Email
  getUserByEmail(String email) async {
    final QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection("Users")
        .where("Email", isEqualTo: email)
        .get();

    if (snapshot.docs.isEmpty) {
      Text('Data Not Found');
    }
    return snapshot.docs.first.data();
  }

  static Future<Map<String, dynamic>?> getUserByPhone(String phone) async {
    final QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection("Users")
        .where("Phone_Number", isEqualTo: phone)
        .get();
    if (snapshot.docs.isEmpty) {
      return null;
    }
    return snapshot.docs.first.data();
  }
}
