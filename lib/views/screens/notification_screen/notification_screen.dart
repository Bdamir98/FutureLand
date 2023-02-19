import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:home_land/models/property_model.dart';
import 'package:home_land/utils/constant.dart';
import 'package:home_land/views/widgets/custom_text.dart';
import 'package:intl/intl.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final usersQuery = FirebaseFirestore.instance
      .collection('All_Payment_Info')
      .where('Buyer_Email', isEqualTo: FirebaseAuth.instance.currentUser!.email)
      .withConverter<PaymentModel>(
        fromFirestore: (snapshot, _) => PaymentModel.fromJson(snapshot.data()!),
        toFirestore: (user, _) => user.toJson(),
      );
  final uEmail = FirebaseAuth.instance.currentUser!.email;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: purpleColor,
          title: Text('Notifications'),
          centerTitle: true,
        ),
        body: FirestoreQueryBuilder<PaymentModel>(
          query: usersQuery,
          builder: (context, snapshot, child) {
            if (snapshot.hasData) {
              return Container(
                height: 700,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.docs.length,
                  itemBuilder: (context, index) {
                    final paymentModel = snapshot.docs[index].data();
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Stack(
                        children: [
                          Container(
                            height: 200,
                            width: double.infinity,
                            child: Image.asset(
                              'assets/notifica.png',
                              height: 100,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 50, left: 130),
                            child: customSubTitleText(
                                'Notificatins', scaffoldBackgroundColor, 18),
                          ),
                          paymentModel.buyerEmail == uEmail
                              ? Padding(
                                  padding: EdgeInsets.only(top: 80, left: 100),
                                  child: customSubTitleText(
                                      'Payment Transfered', Colors.green, 22),
                                )
                              : Padding(
                                  padding: EdgeInsets.only(top: 80, left: 100),
                                  child: customSubTitleText(
                                      'Recieved Payment', Colors.green, 22),
                                ),
                          Padding(
                            padding: const EdgeInsets.only(top: 110, left: 60),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    customSubTitleText('Transaction Id: ',
                                        scaffoldBackgroundColor, 18),
                                    customSubTitleText(
                                        paymentModel.transactionId,
                                        purpleColor,
                                        18),
                                  ],
                                ),
                                Row(
                                  children: [
                                    customSubTitleText(
                                        'Date: ', scaffoldBackgroundColor, 18),
                                    customSubTitleText(
                                        DateFormat('yyyy-MM-dd').format(
                                            paymentModel.buyDate.toDate()),
                                        purpleColor,
                                        18),
                                  ],
                                ),
                                Row(
                                  children: [
                                    customSubTitleText('Land Id: ',
                                        scaffoldBackgroundColor, 18),
                                    customSubTitleText(
                                        paymentModel.landId, purpleColor, 18),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              );
            }
            return Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/notification.png',
                        height: 250,
                      ),
                      customSubTitleText(
                          'No Notifications Yet', scaffoldBackgroundColor, 20),
                      customSubTitleText(
                          'You have currently no notifications.We notify',
                          Colors.grey,
                          12),
                      customSubTitleText(
                          'you when something new arrives', Colors.grey, 12),
                    ]),
              ),
            );
          },
        ),
      ),
    );
  }
}

// return Center(
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 100),
//                   child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Image.asset(
//                           'assets/notification.png',
//                           height: 280,
//                         ),
//                         customSubTitleText('No Notifications Yet',
//                             scaffoldBackgroundColor, 25),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text(
//                           'You have notifications right now\n Come back later',
//                           style:
//                               TextStyle(color: Colors.blueGrey, fontSize: 15),
//                           textAlign: TextAlign.center,
//                         )
//                       ]),
//                 ),
//               );
