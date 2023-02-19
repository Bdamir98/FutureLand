import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:home_land/models/bank_model.dart';
import 'package:home_land/provider/user_provider.dart';
import 'package:home_land/utils/constant.dart';
import 'package:home_land/views/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class MyBankAccount extends StatelessWidget {
  MyBankAccount({super.key, required});

  @override
  Widget build(BuildContext context) {
    final nid = context.read<UserProvider>();
    final newNid = nid.nidNumber;
    print(newNid);
    final usersQuery = FirebaseFirestore.instance
        .collection('Bank_Server')
        .where('Nid_Number', isEqualTo: newNid)
        .withConverter<BankServerModel>(
          fromFirestore: (snapshot, _) =>
              BankServerModel.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );

    return Scaffold(
      appBar: AppBar(
        title: Text('My Bank Account'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/bankthumbnail.jpg'),
              Container(
                height: 350,
                child: FirestoreListView(
                  query: usersQuery,
                  itemBuilder: (context, snapshot) {
                    BankServerModel userData = snapshot.data();

                    return Card(
                      color: Color.fromARGB(209, 255, 255, 255),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                customTitleText('Holder Name: ',
                                    scaffoldBackgroundColor, 20),
                                customTitleText(userData.Account_Holder_Name,
                                    purpleColor, 15),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                customTitleText(
                                    'Bank Name: ', scaffoldBackgroundColor, 20),
                                customTitleText(
                                    userData.Bank_Name, purpleColor, 15),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                customTitleText('Branch Name: ',
                                    scaffoldBackgroundColor, 20),
                                customTitleText(
                                    userData.Branch_Name, purpleColor, 15),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                customTitleText('Branch Location: ',
                                    scaffoldBackgroundColor, 20),
                                customTitleText(
                                    userData.Branch_Location, purpleColor, 15),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                customTitleText(
                                    'Balance: ', scaffoldBackgroundColor, 20),
                                customTitleText(
                                    '৳${userData.Balance.toString()}',
                                    purpleColor,
                                    15),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
