import 'package:flutter/material.dart';
import 'package:home_land/custom_widget/custom_button.dart';
import 'package:home_land/custom_widget/custom_text_field.dart';
import 'package:home_land/custom_widget/custom_toast.dart';
import 'package:home_land/provider/firebase_database_provider.dart';
import 'package:provider/provider.dart';

import 'user_phoneNumber_verification.dart';

class NidUserSearch extends StatefulWidget {
  NidUserSearch({super.key});

  @override
  State<NidUserSearch> createState() => _NidUserSearchState();
}

class _NidUserSearchState extends State<NidUserSearch> {
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
            child: Consumer<MyNidCardData>(
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
                    ),
                    Text(
                      provider.isFoundMsg,
                      style: TextStyle(
                          color: provider.value != null
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
                      visible: provider.value != null ? true : false,
                      child: CustomButton(
                        buttonTitle: 'Next',
                        buONpress: () {
                          Navigator.pop(context);
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => UserphoneNumberVerify(
                                nidSnapshot: provider.value),
                          ));
                        },
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    // Visibility(
                    //   visible: provider.value != null ? true : false,
                    //   child: CustomButton(
                    //     buttonTitle: 'Next',
                    //     buONpress: () {
                    //       Navigator.pop(context);
                    //       Navigator.of(context).push(MaterialPageRoute(
                    //         builder: (context) => UserphoneNumberVerify(
                    //             nidSnapshot: provider.value),
                    //       ));
                    //     },
                    //   ),
                    // ),

                    SizedBox(
                      height: 20,
                    ),
                    // CustomButton(
                    //   buttonTitle: 'Next',
                    //   buONpress: () {
                    //     usersCollection
                    //         .where('Nid_Number', isEqualTo: nidData.text.toString())
                    //         .get()
                    //         .then((QuerySnapshot snapshot) {
                    //       snapshot.docs.forEach((DocumentSnapshot doc) {
                    //         if (doc.data() != null) {
                    //           print(doc['Name']);
                    //           Navigator.of(context).push(
                    //             MaterialPageRoute(
                    //               builder: (context) =>
                    //                   NidCardResultView(nidSnapshot: doc),
                    //             ),
                    //           );
                    //         } else {
                    //           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    //             content: Text('Hi! i am snackbar'),
                    //           ));
                    //         }
                    //       });
                    //     });
                    //   },
                    // ),
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
