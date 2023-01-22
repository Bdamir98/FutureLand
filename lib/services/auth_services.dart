import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthService {
  // initializing firebase auth
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static Future<void> get reload => _auth.currentUser!.reload();
  // this function will return current user information
  static User? get user => _auth.currentUser;

  static Future<bool> checkIsVerified() async {
    await reload;
    return user!.emailVerified;
  }

  static getDataUsingDocumentId(String id, String CName) async {
    final DocumentSnapshot document =
        await FirebaseFirestore.instance.collection(CName).doc(id).get();
    if (document.exists) {
      final Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      return data;
    } else {
      return Text('data');
    }
  }

  static getDataUsingNid(
      String CollectionName, String FindingTable, String CompareData) async {
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection(CollectionName)
        .where(FindingTable, isEqualTo: CompareData)
        .get();
    final List<DocumentSnapshot> documents = result.docs;
    if (documents.length == 0) {
      log('data not found');
    } else {
      final Map<String, dynamic> documentId =
          documents[0].data() as Map<String, dynamic>;
      return documentId;
    }
  }

  static getDataUsingPhone() async {
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('Users')
        .where('Phone_Number', isEqualTo: '+8801772209115')
        .get();
    final List<DocumentSnapshot> documents = result.docs;
    if (documents.length == 0) {
      log('data not found');
    } else {
      final String documentId = documents[0].id;
      return documentId;
    }
  }

  static Future<Map<String, dynamic>> getUserByPhone() async {
    final QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection("Users")
        .where("Phone_Number", isEqualTo: '+8801772209115')
        .get();

    if (snapshot.docs.isNotEmpty) {
      return snapshot.docs.first.data();
    } else {
      throw Text('data');
    }
  }

  static Future<bool> signOut() async {
    await _auth.signOut();
    return true;
  }

  static getDataUsingDocument(String id, String CName) async {
    final DocumentSnapshot document =
        await FirebaseFirestore.instance.collection(CName).doc(id).get();
    if (document.exists) {
      final userNid = document['Nid_Number'];
      final userData =
          await getDataUsingNid('Land_Server', 'Nid_Number', userNid);
      return userData;
    } else {
      return Text('data');
    }
  }
}
