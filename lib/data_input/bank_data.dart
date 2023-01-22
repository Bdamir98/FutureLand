import 'package:flutter/material.dart';

class BankDataAdd extends StatelessWidget {
  const BankDataAdd({super.key});

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
                  'Bank Server',
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
