class BankServerModel {
  String Account_No;
  String Account_Holder_Name;
  String Bank_Name;
  String Branch_Name;
  String Phone_Number;
  String Nid_Number;
  String User_Photo;
  String Branch_Location;
  num Balance;

  BankServerModel({
    required this.Account_Holder_Name,
    required this.Account_No,
    required this.Bank_Name,
    required this.Branch_Location,
    required this.Branch_Name,
    required this.User_Photo,
    required this.Phone_Number,
    required this.Nid_Number,
    required this.Balance,
  });

  Map<String, Object> toJson() {
    return {
      'Account_Holder_Name': Account_Holder_Name,
      'Account_No': Account_No,
      'Phone_Number': Phone_Number,
      'Bank_Name': Bank_Name,
      'Branch_Location': Branch_Location,
      'Branch_Name': Branch_Name,
      'User_Photo': User_Photo,
      'Nid_Number': Nid_Number,
      'Balance': Balance,
    };
  }

  BankServerModel.fromJson(Map<String, Object?> json)
      : this(
          Account_Holder_Name: json['Account_Holder_Name'] as String,
          Account_No: json['Account_No'] as String,
          Phone_Number: json['Phone_Number'] as String,
          Bank_Name: json['Bank_Name'] as String,
          Branch_Location: json['Branch_Location'] as String,
          Branch_Name: json['Branch_Name'] as String,
          User_Photo: json['User_Photo'] as String,
          Nid_Number: json['Nid_Number'] as String,
          Balance: json['Balance'] as num,
        );
}
