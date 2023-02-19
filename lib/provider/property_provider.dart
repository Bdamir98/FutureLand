// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';
// import 'package:home_land/models/property_model.dart';

// class PropertyProvider extends ChangeNotifier {
//   // List<PropertyModel>? property;
//   // userinfoByEmail(String email) async {
//   //   property = await PropertyServices().fetchAllProperty();
//   //   notifyListeners();
//   // }

//   final FirebaseFirestore _db = FirebaseFirestore.instance;

//   List<PropertyModel> collectionData = [];

//   fetchAllPropertyData() async {
//     List<PropertyModel> newList = [];
//     PropertyModel propertyModel;
//     QuerySnapshot querySnapshot =
//         await _db.collection("All_Property_Post").get();
//         querySnapshot.docs.forEach((element) { 
//           propertyModel = PropertyModel(
//           dag_No: element.get('Dag_No'),
//           khotian_No: element.get('Khotian_No'),
//           mouja_No: element.get('Mouja_No'),
//           phone_Number: element.get('Phone_Number'),
//           property_Description: element.get('Property_Description'),
//           property_Location: element.get('Property_Location'),
//           property_Name: element.get('Property_Name'),
//           property_Photo: element.get('Property_Photo'),
//           property_Price: element.get('Property_Price'),
//           property_Size: element.get('Property_Size'),
//           userName: element.get('Seller_Name'),
//         );
//         newList.add(propertyModel);
//         });

    
//     collectionData = newList;
//     notifyListeners();
//   }

//   List<PropertyModel> get showAllPropertyDataList {
//     return collectionData;
//   }
// }
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';
// import 'package:home_land/models/property_model.dart';

// class PropertyProvider extends ChangeNotifier {

//   final FirebaseFirestore _db=FirebaseFirestore.instance;
//   List<PropertyModel> propertyList=[];
//   getPropertyAllData()async{
//     PropertyModel propertyModel;
//     List<PropertyModel> newlist=[];
//     QuerySnapshot data=await _db.collection('All_Property_Post').get();
//     for (var element in data.docs) {
//       if (element.exists) {
//         propertyModel=PropertyModel.fromJson(element.data());
//         newlist.add(propertyModel);
//         notifyListeners();
//       }
//     }
//     propertyList=newlist;
//     notifyListeners();
//     return propertyList;
//   }


//   int count=0;
  
// }
