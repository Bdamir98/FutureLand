import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:home_land/utils/constant.dart';
import 'package:home_land/views/widgets/custom_button.dart';
import 'package:home_land/views/widgets/custom_text.dart';
import 'package:intl/intl.dart';

import 'user_emai_registration.dart';

class NidCardResultView extends StatelessWidget {
  NidCardResultView({super.key, required this.nidSnapshot});
  final Map<String, dynamic> nidSnapshot;

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
                    radius: 50,
                    backgroundImage: NetworkImage(
                      nidSnapshot['Nid_Photo'],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    customSubTitleText('Name:', canvasColor),
                    SizedBox(
                      width: 60,
                    ),
                    customSubTitleText('${nidSnapshot['Name']}', purpleColor),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    customSubTitleText('Father Name:', canvasColor),
                    SizedBox(
                      width: 15,
                    ),
                    customSubTitleText(
                        '${nidSnapshot['Father_Name']}', purpleColor),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    customSubTitleText('Mother Name:', canvasColor),
                    SizedBox(
                      width: 10,
                    ),
                    customSubTitleText(
                        '${nidSnapshot['Mother_Name']}', purpleColor),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    customSubTitleText('Date Of Birth:', canvasColor),
                    SizedBox(
                      width: 20,
                    ),
                    customSubTitleText('${formattedDate}', purpleColor),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    customSubTitleText('Nid Number:', canvasColor),
                    SizedBox(
                      width: 30,
                    ),
                    customSubTitleText(
                        '${nidSnapshot['Nid_Number']}', purpleColor),
                  ],
                ),
                Spacer(),
                CustomButton(
                  buttonTitle: 'Next',
                  buONpress: () {
                    showLoadingDialog(context);
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
