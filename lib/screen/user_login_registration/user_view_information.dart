import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:home_land/constant.dart';
import 'package:home_land/custom_widget/custom_button.dart';
import 'package:home_land/custom_widget/custom_text.dart';
import 'package:home_land/screen/user_login_registration/user_emai_registration.dart';
import 'package:intl/intl.dart';

class NidCardResultView extends StatelessWidget {
  NidCardResultView({super.key, required this.nidSnapshot});
  Map<String, dynamic> nidSnapshot;

  @override
  Widget build(BuildContext context) {
    final Timestamp timestamp = nidSnapshot['Date_of_Birth'];
    String formattedDate = DateFormat('dd-MM-yyyy').format(timestamp.toDate());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 60,
                    child: ClipOval(
                      child: Image.network(
                        nidSnapshot['Nid_Photo'],
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    customText('Name:', canvasColor),
                    SizedBox(
                      width: 80,
                    ),
                    customText('${nidSnapshot['Name']}', Colors.black),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    customText('Father Name:', canvasColor),
                    SizedBox(
                      width: 15,
                    ),
                    customText('${nidSnapshot['Father_Name']}', Colors.black),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    customText('Mother Name:', canvasColor),
                    SizedBox(
                      width: 10,
                    ),
                    customText('${nidSnapshot['Mother_Name']}', Colors.black),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    customText('Date Of Birth:', canvasColor),
                    SizedBox(
                      width: 20,
                    ),
                    customText('${formattedDate}', Colors.black),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    customText('Nid Number', canvasColor),
                    SizedBox(
                      width: 30,
                    ),
                    customText('${nidSnapshot['Nid_Number']}', Colors.black),
                  ],
                ),
                Spacer(),
                CustomButton(
                  buttonTitle: 'Next',
                  buONpress: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UserEmailPasswordRegistration(
                          nidSnapshot: nidSnapshot),
                    ));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
