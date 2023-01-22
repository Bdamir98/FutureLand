import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:home_land/constant.dart';
import 'package:home_land/services/auth_services.dart';

class AllMyProperty extends StatelessWidget {
  AllMyProperty({super.key});
  final _auth = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: canvasColor,
        title: Text('My Property'),
        centerTitle: true,
      ),
      body: FutureBuilder<dynamic>(
        future: AuthService.getDataUsingDocument(_auth!.uid, 'Users'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data,
              itemBuilder: (context, index) {
                return Text('data');
              },
            );
          } else {
            print('Data not Found');
          }
          return Container();
        },
      ),
    );
  }
}
