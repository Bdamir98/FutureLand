import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:home_land/provider/user_provider.dart';
import 'package:home_land/views/pages/user_registration_page/user_phoneNumber_verification.dart';
import 'package:home_land/views/widgets/custom_button.dart';
import 'package:home_land/views/widgets/custom_text_field.dart';
import 'package:home_land/views/widgets/custom_toast.dart';
import 'package:provider/provider.dart';

class UserRegistrationByNid extends StatefulWidget {
  UserRegistrationByNid({super.key});

  @override
  State<UserRegistrationByNid> createState() => _UserRegistrationByNidState();
}

class _UserRegistrationByNidState extends State<UserRegistrationByNid> {
  TextEditingController nidData = TextEditingController();
  // final CollectionReference usersCollection =
  //     FirebaseFirestore.instance.collection('Nid_Server');
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 50),
            child: Consumer<UserProvider>(
              builder: (context, provider, child) {
                return Column(
                  children: [
                    Image.asset(
                      'assets/logo-ec.png',
                      height: 150,
                      width: 150,
                    ),
                    CustomFormField(
                      hintText: 'Nid Number',
                      keyboard: TextInputType.number,
                      controller: nidData,
                      textLines: 1,
                    ),
                    Text(
                      provider.isFoundMsg.toString(),
                      style: TextStyle(
                          color: (provider.isEligible == true)
                              ? Colors.green
                              : Colors.red),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (nidData.text.isEmpty) {
                          messageToast(context, 'Enter Nid Number');
                        } else {
                          provider.getUserByNidNumber(
                              nidData, 'Nid_Server', 'Nid_Number');
                        }
                      },
                      child: Text('Check Nid'),
                    ),
                    Visibility(
                      visible: provider.value != null,
                      child: CustomButton(
                          buttonTitle: 'Next',
                          buONpress: () async {
                            //Navigator.pop(context);
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (context) => NidCardResultView(
                            //         nidSnapshot: provider.value),
                            //   ),
                            // );
                            // print('object');

                            final snapShot = await FirebaseFirestore.instance
                                .collection("Users")
                                .where("Nid_Number", isEqualTo: nidData.text)
                                .get();
                            print(snapShot.docs);
                            if (snapShot.docs.isNotEmpty) {
                              messageToast(context,
                                  'Alreday Account Create By This NID Number');
                            } else {
                              //Navigator.pop(context);
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => UserphoneNumberVerify(
                                      nidSnapshot: provider.value),
                                ),
                              );
                            }
                          }),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
