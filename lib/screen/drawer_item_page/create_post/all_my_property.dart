import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:home_land/constant.dart';
import 'package:home_land/services/auth_services.dart';

class AllMyProperty extends StatelessWidget {
  AllMyProperty({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: canvasColor,
        title: Text('My Property'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Nid_Server')
            .where('Nid_Number',
                isEqualTo: FirebaseFirestore.instance
                    .collection('Users')
                    .doc(FirebaseAuth.instance.currentUser!.uid))
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                if (snapshot.hasData && snapshot.data != null) {
                  final userData = snapshot.data!.docs[index].data();
                  print(userData['Phone_Number']);
                  return Card(
                    child: ListTile(
                      title: Text(userData['District']),
                    ),
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
