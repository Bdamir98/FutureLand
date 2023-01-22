import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:home_land/services/auth_services.dart';

class MyNidCardData extends ChangeNotifier {
  dynamic _value;
  dynamic get value => _value;
  String isFoundMsg = '';
  set value(dynamic newValue) {
    _value = newValue;
    notifyListeners();
  }

  Future<void> getUserByNidNumber(TextEditingController nidController,
      String CollectionName, String FindingField) async {
    final CollectionReference usersCollection =
        await FirebaseFirestore.instance.collection(CollectionName);
    usersCollection
        .where(FindingField, isEqualTo: nidController.text.toString())
        .get()
        .then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((DocumentSnapshot snapshot) {
        value = snapshot.data();
        if (value != null) {
          isFoundMsg = 'Data Found';
          notifyListeners();
        } else {
          isFoundMsg = 'Data Not Found';
          notifyListeners();
        }
      });
    });
  }




  Map<String, dynamic>? userData;
  userinfoByPhone() async {
    userData = await AuthService.getUserByPhone();
    notifyListeners();
  }
}
