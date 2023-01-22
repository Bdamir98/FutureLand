import 'package:flutter/material.dart';

import 'package:home_land/custom_widget/custom_button.dart';
import 'package:home_land/data_input/bank_data.dart';
import 'package:home_land/data_input/land_data.dart';
import 'package:home_land/data_input/nid_card.dart';

class DataInputScreen extends StatelessWidget {
  const DataInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              buttonTitle: 'Nid Card Add',
              buONpress: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddNidCard(),
                ));
              },
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              buttonTitle: 'Land Data Add',
              buONpress: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LandDataAdd(),
                ));
              },
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              buttonTitle: 'Bank Data Add',
              buONpress: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BankDataAdd(),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
