import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:home_land/models/user_model.dart';
import 'package:home_land/services/firebase_query/user_firebase_query.dart';
import 'package:image_picker/image_picker.dart';

class UserProvider extends ChangeNotifier {
  ImageSource _imageSource = ImageSource.camera;
  String? userImagePath;
  XFile? userImageFile;
  String? genderGroupValue;
  DateTime? dob;
  void reset() {
    userImagePath = null;
    userImageFile = null;
    genderGroupValue = null;
    dob = null;
    notifyListeners();
  }

  void setGenderGroupValue(String value) {
    genderGroupValue = value;
    notifyListeners();
  }

  void setDob(DateTime dateTime) {
    dob = dateTime;
    notifyListeners();
  }

  /*
  * Database query*/

  // fetch user by email
  Map<String, dynamic>? userEmail;
  userinfoByEmail(String email) async {
    userEmail = await UserService().getUserByEmail(email);
    notifyListeners();
  }

  Map<String, dynamic>? userData;
  userinfoByPhone(String phone) async {
    userData = await UserService.getUserByPhone(phone);
    notifyListeners();
  }

  // List<UserModel> userDataModel = [];
  // getUserDataFromModel(String uid) async {
  //   List<UserModel> newlist = [];
  //   await FirebaseFirestore.instance.collection("Users").doc(uid).get().then(
  //     (snapshot) {
  //       if (snapshot.exists) {
  //         Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
  //         UserModel userModel = UserModel.fromJson(data);
  //         newlist.add(userModel);
  //       }
  //     },
  //   ).catchError((e) {
  //     print(e);
  //   });
  //   userDataModel = newlist;
  //   return userDataModel;
  // }
  UserModel? userDataModel;

  Future<void> getUserDataFromModel() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      await FirebaseFirestore.instance.collection("Users").doc(currentUser.uid).get().then(
        (snapshot) {
          if (snapshot.exists) {
            // var data = snapshot.data;

             print("Data: ${snapshot.data()}");
            // var data = jsonDecode(snapshot.data());

            userDataModel = UserModel.fromJson(snapshot.data()!);
          }
        },
      ).catchError((e) {
        print(e);
      });
    }
    print("pro: $userDataModel");
    // userDataModel = newlist;
    notifyListeners();
  }

  //Get User All Data Using Current User Uid
  //In this Function we get the data from current login user UID
  //and store the data in provider list for access
  // dynamic _nidNumber;

  // String get nidNumber => _nidNumber;

  // Future<void> getUserData() async {
  //   final currentUser = await FirebaseAuth.instance.currentUser!.uid;
  //   DocumentSnapshot snapshot = await FirebaseFirestore.instance
  //       .collection("Users")
  //       .doc(currentUser)
  //       .get();
  //   Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

  //   _nidNumber = data['Nid_Number'];
  //   notifyListeners();
  // }
  dynamic _nidNumber;

  String get nidNumber => _nidNumber;

  Future<void> getUserData() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      _nidNumber = null;
      notifyListeners();
      return;
    }
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUser.uid)
        .get();
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    _nidNumber = data['Nid_Number'];
    notifyListeners();
  }

  //fsdgdfgfdgfdgfdgf
  //fdfgrgfdg
  dynamic _value;
  dynamic get value => _value;
  String isFoundMsg = '';
  bool? isEligible;
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
          isEligible = true;
          isFoundMsg = 'Data Found';
          notifyListeners();
        } else {
          isEligible = false;
          isFoundMsg = 'Data Not Found';
          notifyListeners();
        }
      });
    });
  }

  void resetData() {
    _imageSource = ImageSource.camera;
    userImagePath = null;
    userImageFile = null;
    genderGroupValue = null;
    dob = null;
    userEmail = null;
    userData = null;
    userDataModel = null;
    _nidNumber = null;
    _value = null;
    isFoundMsg = '';
    isEligible = null;
    notifyListeners();
  }
}
