// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:cloud_firestore/cloud_firestore.dart';

// class UserModel {
// String District;
// String Division;
// String Email;
// String Father_Name;
// String Gender;
// String Mother_Name;
// String Name;
// String Nid_Number;
// String Phone_Number;
// String UserPhoto;
// String Upozilla;
// Timestamp Date_of_Birth;

//   UserModel({
//     required this.Phone_Number,
//     required this.District,
//     required this.Division,
//     required this.Email,
//     required this.Father_Name,
//     required this.Gender,
//     required this.Mother_Name,
//     required this.Name,
//     required this.Nid_Number,
//     required this.UserPhoto,
//     required this.Date_of_Birth,
//     required this.Upozilla,
//   });

//   Map<String, Object> toJson() {
//     return {
//       'District': District,
//       'Division': Division,
//       'Email': Email,
//       'Father_Name': Father_Name,
//       'Gender': Gender,
//       'Mother_Name': Mother_Name,
//       'Name': Name,
//       'Nid_Number': Nid_Number,
//       'UserPhoto': UserPhoto,
//       'Upozilla': Upozilla,
//       'Date_of_Birth': Date_of_Birth,
//     };
//   }

//   UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//       Phone_Number: json["Phone_Number"],
//       District: District,
//       Division: Division,
//       Email: Email,
//       Father_Name: Father_Name,
//       Gender: Gender,
//       Mother_Name: Mother_Name,
//       Name: Name,
//       Nid_Number: Nid_Number,
//       UserPhoto: UserPhoto,
//       Date_of_Birth: Date_of_Birth,
//       Upozilla: Upozilla,
//     );
//   }
//   // UserModel.fromJson(Map<String, dynamic> json)
//   //     : this(
//   //         Date_of_Birth: json['Date_of_Birth'] as Timestamp,
//   //         Phone_Number: json['Phone_Number'] as String,
//   //         District: json['District'] as String,
//   //         Division: json['Division'] as String,
//   //         Email: json['Email'] as String,
//   //         Father_Name: json['Father_Name'] as String,
//   //         Gender: json['Gender'] as String,
//   //         Mother_Name: json['Mother_Name'] as String,
//   //         Name: json['Name'] as String,
//   //         Nid_Number: json['Nid_Number'] as String,
//   //         UserPhoto: json['UserPhoto'] as String,
//   //         Upozilla: json['Upozilla'] as String,
//   //       );
// }
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  UserModel({
    this.Phone_Number,
    this.District,
    this.Division,
    this.Email,
    this.Father_Name,
    this.Gender,
    this.Mother_Name,
    this.Name,
    this.Nid_Number,
    this.UserPhoto,
    this.Upozila,
    this.Date_of_Birth,
  });

  UserModel.fromJson(dynamic json) {
    Phone_Number = json['Phone_Number'];
    District = json['District'];
    Upozila = json['Upozila'];
    Division = json['Division'];
    Email = json['Email'];
    Father_Name = json['Father_Name'];
    Gender = json['Gender'];
    Mother_Name = json['Mother_Name'];
    Name = json['Name'];
    Nid_Number = json['Nid_Number'];
    UserPhoto = json['UserPhoto'];
    Date_of_Birth = json['Date_of_Birth'];
  }
  String? District;
  String? Upozila;
  String? Division;
  String? Email;
  String? Father_Name;
  String? Gender;
  String? Mother_Name;
  String? Name;
  String? Nid_Number;
  String? Phone_Number;
  String? UserPhoto;
  Timestamp? Date_of_Birth;
  UserModel copyWith({
    String? Name,
    String? District,
    String? Upozila,
    String? Division,
    String? Email,
    String? Father_Name,
    String? Gender,
    String? Mother_Name,
    String? Nid_Number,
    String? Phone_Number,
    String? UserPhoto,
    Timestamp? Date_of_Birth,
  }) =>
      UserModel(
        Name: Name ?? this.Name,
        Upozila: Upozila ?? this.Upozila,
        District: District ?? this.District,
        Division: Division ?? this.Division,
        Email: Email ?? this.Email,
        Father_Name: Father_Name ?? this.Father_Name,
        Gender: Gender ?? this.Gender,
        Mother_Name: Mother_Name ?? this.Mother_Name,
        Nid_Number: Nid_Number ?? this.Nid_Number,
        Phone_Number: Phone_Number ?? this.Phone_Number,
        UserPhoto: UserPhoto ?? this.UserPhoto,
        Date_of_Birth: Date_of_Birth ?? this.Date_of_Birth,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Name'] = Name;
    map['District'] = District;
    map['Upozila'] = Upozila;
    map['Division'] = Division;
    map['Email'] = Email;
    map['Father_Name'] = Father_Name;
    map['Gender'] = Gender;
    map['Mother_Name'] = Mother_Name;
    map['Nid_Number'] = Nid_Number;
    map['Phone_Number'] = Phone_Number;
    map['UserPhoto'] = UserPhoto;
    map['Date_of_Birth'] = Date_of_Birth;
    return map;
  }
}
