import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class AddNidCard extends StatelessWidget {
  AddNidCard({super.key});
 final TextEditingController email = TextEditingController();
 final TextEditingController pass = TextEditingController();
final  TextEditingController phone = TextEditingController();
 final CollectionReference users = FirebaseFirestore.instance.collection('Users');
  void addData() {
    users.add({"name": "John Doe", "email": "johndoe@example.com", "age": 30});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Center(
            child: Column(
              children: [
                Text(
                  'Add Nid card User',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
