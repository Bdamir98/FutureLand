import 'package:flutter/material.dart';


class LandDataAdd extends StatelessWidget {
  const LandDataAdd({super.key});

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
                  'Land Server',
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
