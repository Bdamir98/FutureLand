import 'package:cloud_firestore/cloud_firestore.dart';

class LandServerModel {
  String Owner_Name;
  String Property_Name;
  String Property_Size;
  String Land_Location;
  List<dynamic> Land_Photo;
  String Phone_Number;
  String Dag_No;
  String Mouja_No;
  String Khotian_No;
  String Father_Name;
  String Mother_Name;
  String Nationality;
  String Nid_Number;
  String Availability;
  String Land_Id;

  LandServerModel({
    required this.Owner_Name,
    required this.Property_Name,
    required this.Property_Size,
    required this.Land_Location,
    required this.Land_Photo,
    required this.Phone_Number,
    required this.Dag_No,
    required this.Mouja_No,
    required this.Khotian_No,
    required this.Father_Name,
    required this.Mother_Name,
    required this.Nationality,
    required this.Nid_Number,
    required this.Availability,
    required this.Land_Id,
  });

  Map<String, Object> toJson() {
    return {
      'Owner_Name': Owner_Name,
      'Property_Name': Property_Name,
      'Property_Size': Property_Size,
      'Land_Location': Land_Location,
      'Land_Photo': Land_Photo,
      'Phone_Number': Phone_Number,
      'Dag_No': Dag_No,
      'Mouja_No': Mouja_No,
      'Khotian_No': Khotian_No,
      'Father_Name': Father_Name,
      'Mother_Name': Mother_Name,
      'Nationality': Nationality,
      'Nid_Number': Nid_Number,
      'Availability;': Availability,
      'Land_Id;': Land_Id,
    };
  }

  LandServerModel.fromJson(Map<String, Object?> json)
      : this(
          Owner_Name: json['Name'] as String,
          Property_Name: json['Property_Name'] as String,
          Property_Size: json['Property_Size'] as String,
          Land_Location: json['Land_Location'] as String,
          Land_Photo: json['Land_Photo'] as List<dynamic>,
          Phone_Number: json['Phone_Number'] as String,
          Dag_No: json['Dag_No'] as String,
          Mouja_No: json['Mouja_No'] as String,
          Khotian_No: json['Khotian_No'] as String,
          Father_Name: json['Father_Name'] as String,
          Mother_Name: json['Mother_Name'] as String,
          Nationality: json['Nationality'] as String,
          Nid_Number: json['Nid_Number'] as String,
          Availability: json['Availability'] as String,
          Land_Id: json['Land_Id'] as String,
        );
}

class LandSellModel {
  String Seller_Name;
  String Land_Id;
  String Nid_Number;
  int Popularity;
  String Property_Name;
  String Property_Size;
  String Property_Location;
  List<dynamic> Property_Photo;
  String Phone_Number;
  String Dag_No;
  String Mouja_No;
  String Khotian_No;
  String Property_Description;
  String Property_Price;
  String Email;
  String Seller_Photo;
  String Availability;
  Timestamp Added_Date;

  LandSellModel({
    required this.Seller_Name,
    required this.Popularity,
    required this.Nid_Number,
    required this.Email,
    required this.Seller_Photo,
    required this.Property_Name,
    required this.Property_Size,
    required this.Property_Location,
    required this.Property_Photo,
    required this.Phone_Number,
    required this.Dag_No,
    required this.Mouja_No,
    required this.Khotian_No,
    required this.Added_Date,
    required this.Property_Description,
    required this.Property_Price,
    required this.Availability,
    required this.Land_Id,
  });

  Map<String, Object> toJson() {
    return {
      'Seller_Name': Seller_Name,
      'Nid_Number': Nid_Number,
      'Popularity': Popularity,
      'Seller_Photo': Seller_Photo,
      'Email': Email,
      'Property_Name': Property_Name,
      'Property_Size': Property_Size,
      'Property_Location': Property_Location,
      'Property_Photo': Property_Photo,
      'Phone_Number': Phone_Number,
      'Dag_No': Dag_No,
      'Mouja_No': Mouja_No,
      'Khotian_No': Khotian_No,
      'Added_Date': Added_Date,
      'Property_Description': Property_Description,
      'Property_Price': Property_Price,
      'Availability': Availability,
      'Land_Id': Land_Id,
    };
  }

  LandSellModel.fromJson(Map<String, Object?> json)
      : this(
          Seller_Name: json['Seller_Name'] as String,
          Nid_Number: json['Nid_Number'] as String,
          Popularity: json['Popularity'] as int,
          Email: json['Email'] as String,
          Seller_Photo: json['Seller_Photo'] as String,
          Property_Name: json['Property_Name'] as String,
          Property_Size: json['Property_Size'] as String,
          Property_Location: json['Property_Location'] as String,
          Property_Photo: json['Property_Photo'] as List<dynamic>,
          Phone_Number: json['Phone_Number'] as String,
          Dag_No: json['Dag_No'] as String,
          Mouja_No: json['Mouja_No'] as String,
          Khotian_No: json['Khotian_No'] as String,
          Property_Price: json['Property_Price'] as String,
          Property_Description: json['Property_Description'] as String,
          Availability: json['Availability'] as String,
          Land_Id: json['Land_Id'] as String,
          Added_Date: json['Added_Date'] as Timestamp,
        );
}

class PaymentModel {
  String senderName;
  String sellerAccount;
  num amount;
  String pName;
  String pSize;
  String pPrice;
  String pLocation;
  String dagNo;
  String khotianNo;
  String moujaNo;
  String sellerName;
  String sellerEmail;
  String buyerEmail;
  String paymentMethod;
  String transactionId;
  String landId;
  List<dynamic> pPhoto;
  Timestamp buyDate;

  PaymentModel({
    required this.amount,
    required this.buyDate,
    required this.dagNo,
    required this.khotianNo,
    required this.moujaNo,
    required this.pLocation,
    required this.pName,
    required this.pPhoto,
    required this.pPrice,
    required this.pSize,
    required this.paymentMethod,
    required this.sellerAccount,
    required this.sellerEmail,
    required this.buyerEmail,
    required this.sellerName,
    required this.senderName,
    required this.transactionId,
    required this.landId,
  });

  Map<String, Object> toJson() {
    return {
      'Transaction_Id': transactionId,
      'Land_Id': landId,
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
    };
  }

  PaymentModel.fromJson(Map<String, Object?> json)
      : this(
          transactionId: json['Transaction_Id'] as String,
          landId: json['Land_Id'] as String,
          senderName: json['BuyerName'] as String,
          sellerAccount: json['Seller_Bank_Account'] as String,
          amount: json['Amount'] as num,
          pName: json['Property_Name'] as String,
          pSize: json['Property_size'] as String,
          pLocation: json['Property_Location'] as String,
          pPhoto: json['Property_Photo'] as List<dynamic>,
          dagNo: json['Dag_No'] as String,
          moujaNo: json['Mouja_NO'] as String,
          khotianNo: json['Khotian_No'] as String,
          sellerName: json['Seller_Name'] as String,
          sellerEmail: json['Seller_Email'] as String,
          buyerEmail: json['Buyer_Email'] as String,
          pPrice: json['Property_Price'] as String,
          paymentMethod: json['Payment_Method'] as String,
          buyDate: json['Buying_Date'] as Timestamp,
        );
}
