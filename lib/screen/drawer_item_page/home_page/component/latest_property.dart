import 'package:flutter/material.dart';
import 'package:home_land/constant.dart';

class LatestProperty extends StatelessWidget {
  const LatestProperty({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Latest Property',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(
                'See all',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: purpleColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
