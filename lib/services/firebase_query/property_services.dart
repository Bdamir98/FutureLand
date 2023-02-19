import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PropertyServices {
  void transferMoney(
      String sellerAccountNumber, String buyerAccountNumber, num amount) async {
    final buyserInfo = await FirebaseFirestore.instance
        .collection('Bank_Server')
        .where('Account_No', isEqualTo: buyerAccountNumber)
        .get();
    final buyerBalance = buyserInfo.docs.first.data()['Balance'];
    num buyerNewBalance = buyerBalance - amount;
    print(buyserInfo.docs.first.data()['Balance']);
    await FirebaseFirestore.instance
        .collection('Bank_Server')
        .doc(buyserInfo.docs.first.id)
        .update({
      'Balance': buyerNewBalance,
    });
    final sellerInfo = await FirebaseFirestore.instance
        .collection('Bank_Server')
        .where('Account_No', isEqualTo: sellerAccountNumber)
        .get();
    final sellerBalance = sellerInfo.docs.first.data()['Balance'];
    num sellerNewBalance = sellerBalance + amount;
    print(sellerInfo.docs.first.data()['Account_Holder_Name']);

    await FirebaseFirestore.instance
        .collection('Bank_Server')
        .doc(sellerInfo.docs.first.id)
        .update({
      'Balance': sellerNewBalance,
    });
  }

  String generateRandomString(int length) {
    const _chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random _rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }

  void paymentDetailsStore(
      String senderName,
      String sellerAccount,
      num amount,
      String pName,
      String pSize,
      String pPrice,
      String pLocation,
      String dagNo,
      String khotianNo,
      String moujaNo,
      String sellerName,
      String sellerEmail,
      String buyerEmail,
      String paymentMethod,
      String Land_Id,
      List<dynamic> pPhoto,
      Timestamp buyDate) async {
    String transactionId =
        generateRandomString(10); // generates a random string of length 10

    final details =
        await FirebaseFirestore.instance.collection('All_Payment_Info');
    details.doc(FirebaseAuth.instance.currentUser!.uid).set({
      'Transaction_Id': transactionId,
      'BuyerName': senderName,
      'Seller_Bank_Account': sellerAccount,
      'Amount': amount,
      'Property_Name': pName,
      'Property_size': pSize,
      'Property_Price': pPrice,
      'Property_Location': pLocation,
      'Dag_No': dagNo,
      'Khotian_No': khotianNo,
      'Mouja_NO': moujaNo,
      'Seller_Name': sellerName,
      'Seller_Email': sellerEmail,
      'Buyer_Email': buyerEmail,
      'Property_Photo': pPhoto,
      'Buying_Date': buyDate,
      'Payment_Method': paymentMethod,
      'Land_Id': Land_Id,
    });
  }

  void ownerShipTransfer(
    String Owner_Name,
    String Property_Name,
    String Property_Size,
    String Land_Location,
    List<dynamic> Land_Photo,
    String Phone_Number,
    String Dag_No,
    String Mouja_No,
    String Khotian_No,
    String Father_Name,
    String Mother_Name,
    String Nid_Number,
  ) async {
    String Land_Id =
        generateRandomString(10);
    final ownerShip = await FirebaseFirestore.instance
        .collection('Land_Server')
        .doc(FirebaseAuth.instance.currentUser!.uid);
    ownerShip.set({
      'Name': Owner_Name,
      'Property_Name': Property_Name,
      'Property_Size': Property_Size,
      'Land_Location': Land_Location,
      'Dag_No': Dag_No,
      'Khotian_No': Khotian_No,
      'Mouja_No': Mouja_No,
      'Land_Photo': Land_Photo,
      'Phone_Number': Phone_Number,
      'Father_Name': Father_Name,
      'Mother_Name': Mother_Name,
      'Nid_Number': Nid_Number,
      'Availability': 'Available',
      'Nationality': 'Bangladeshi',
      'Land_Id': Land_Id,
    });
  }

  void sellerLandServerUpdate(landId) async {
    final sellerPropertyLandServer = await FirebaseFirestore.instance
        .collection('Land_Server')
        .where('Land_Id', isEqualTo: landId)
        .get();
    if (sellerPropertyLandServer.size > 0) {
      await FirebaseFirestore.instance
          .collection('Land_Server')
          .doc(sellerPropertyLandServer.docs.first.id)
          .update({
        'Availability': 'Sold Out',
      });
    } else {
      print('No document found for Land_Id: $landId');
      // Or you can throw an error if appropriate for your use case
    }
  }

  void propertySoldOut(landId) async {
    final propertySoldOut = await FirebaseFirestore.instance
        .collection('All_Property_Post')
        .where('Land_Id', isEqualTo: landId)
        .get();
    final propertyOwner = propertySoldOut.docs.first.data()['Nid_Number'];
    await FirebaseFirestore.instance
        .collection('All_Property_Post')
        .doc(propertySoldOut.docs.first.id)
        .update({'Availability': 'Sold Out'});
  }
}
