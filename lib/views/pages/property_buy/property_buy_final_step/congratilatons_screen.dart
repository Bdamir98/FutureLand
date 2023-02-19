import 'package:flutter/material.dart';
import 'package:home_land/views/screens/home_screen/home_screen.dart';
import 'package:home_land/views/widgets/custom_button.dart';
import 'package:home_land/views/widgets/custom_text.dart';

class CongratulationScreen extends StatelessWidget {
  const CongratulationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Image.asset('assets/congratulations.png'),
              SizedBox(
                height: 20,
              ),
              customSubTitleText(
                  'You have Successfully completed the transaction\n Please check your notifications'),
              SizedBox(
                height: 10,
              ),
              CustomButton(
                buttonTitle: 'Go Home',
                buONpress: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
