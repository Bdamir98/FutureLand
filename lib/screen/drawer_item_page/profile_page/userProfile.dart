import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:home_land/constant.dart';
import 'package:home_land/custom_widget/custom_text.dart';

class UserProfile extends StatelessWidget {
  UserProfile({super.key});
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .where('Email', isEqualTo: FirebaseAuth.instance.currentUser!.email)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                if (snapshot.hasData && snapshot.data != null) {
                  final userData = snapshot.data!.docs[index].data();
                  return Stack(
                    children: [
                      Opacity(
                        opacity: 0.6,
                        child: Container(
                          height: 200,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: purpleColor,
                            image: DecorationImage(
                              image: NetworkImage(userData["UserPhoto"]),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios_outlined,
                                    color: Colors.white,
                                  ),
                                )),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(150),
                        child: Stack(
                          children: [
                            Center(
                              child: CircleAvatar(
                                radius: 50,
                                backgroundColor: purpleColor,
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 2.8),
                                child: CircleAvatar(
                                  radius: 47,
                                  backgroundColor: purpleColor,
                                  backgroundImage:
                                      NetworkImage(userData["UserPhoto"]),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 280, left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customText(
                                    'Name', purpleColor, 20, FontWeight.bold),
                                SizedBox(
                                  height: 5,
                                ),
                                customText(userData['Name'],
                                    scaffoldBackgroundColor, 20),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customText(
                                    'Email', purpleColor, 20, FontWeight.bold),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    customText(userData['Email'],
                                        scaffoldBackgroundColor, 20),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customText(
                                    'Gender', purpleColor, 20, FontWeight.bold),
                                SizedBox(
                                  height: 5,
                                ),
                                customText(userData['Gender'],
                                    scaffoldBackgroundColor, 20),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customText('Address', purpleColor, 20,
                                    FontWeight.bold),
                                SizedBox(
                                  height: 5,
                                ),
                                customText(
                                    "${userData['District']}, ${userData['Division']}",
                                    scaffoldBackgroundColor,
                                    20),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customText(
                                    'Phone', purpleColor, 20, FontWeight.bold),
                                SizedBox(
                                  height: 5,
                                ),
                                customText("${userData['Phone_Number']}",
                                    scaffoldBackgroundColor, 20),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
          }
          return Center(
            child: Text('There is no Data'),
          );
        },
      ),
    );
  }
}
