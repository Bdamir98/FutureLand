import 'package:flutter/material.dart';
import 'package:home_land/models/bank_model.dart';
import 'package:home_land/models/property_model.dart';
import 'package:home_land/utils/constant.dart';
import 'package:home_land/views/pages/property_buy/property_buy_final_step/property_buy_final_step.dart';
import 'package:home_land/views/widgets/custom_button.dart';
import 'package:home_land/views/widgets/custom_text.dart';
import 'package:home_land/views/widgets/custom_text_field.dart';
import 'package:home_land/views/widgets/custom_toast.dart';

class PropertyBuyDetails extends StatelessWidget {
  PropertyBuyDetails(
      {super.key, required this.landSellModel, required this.bankServerModel});
  final LandSellModel landSellModel;
  final BankServerModel bankServerModel;
  final TextEditingController sellerAccountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final propertyPrice = int.parse(landSellModel.Property_Price);
    final governmentTax = 0.02;
    final registrationFee = 0.01;
    final stampDuty = 0.015;
    final bankFee = 1000;
    final double totalCost = propertyPrice +
        (propertyPrice * governmentTax) +
        (propertyPrice * registrationFee) +
        (propertyPrice * stampDuty) +
        bankFee;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 250,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: purpleColor,
                    image: DecorationImage(
                      image: NetworkImage(landSellModel.Property_Photo[0]),
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
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color.fromARGB(38, 255, 255, 255),
                          ),
                          child: Icon(
                            Icons.arrow_back_ios_outlined,
                            color: purpleColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 210, left: 30, right: 30),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customSubTitleText(
                              'Payment method', scaffoldBackgroundColor, 13),
                          SizedBox(
                            height: 3,
                          ),
                          Row(
                            children: [
                              Icon(Icons.credit_card),
                              SizedBox(
                                width: 7,
                              ),
                              customSubTitleText(bankServerModel.Bank_Name,
                                  scaffoldBackgroundColor, 15),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            CustomFormField(
              hintText: 'Enter Seller Account No',
              controller: sellerAccountController,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customSubTitleText(
                      'Property Price', scaffoldBackgroundColor, 15),
                  customSubTitleText(
                    '৳${landSellModel.Property_Price.toString()}',
                    scaffoldBackgroundColor,
                    16,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customSubTitleText(
                      'Government Tex', scaffoldBackgroundColor, 15),
                  customSubTitleText(
                    '+ ${2}%',
                    scaffoldBackgroundColor,
                    16,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customSubTitleText(
                      'Registration Fee', scaffoldBackgroundColor, 15),
                  customSubTitleText(
                    '+ ${1}%',
                    scaffoldBackgroundColor,
                    16,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customSubTitleText('Stamp Duty', scaffoldBackgroundColor, 15),
                  customSubTitleText(
                    '+ ${1.5}%',
                    scaffoldBackgroundColor,
                    16,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customSubTitleText('Bank Fee', scaffoldBackgroundColor, 15),
                  customSubTitleText(
                    '+ ${1000}',
                    scaffoldBackgroundColor,
                    16,
                  )
                ],
              ),
            ),
            Divider(
              thickness: 2,
              indent: 23,
              endIndent: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  customSubTitleText(
                      'Total Ammount', scaffoldBackgroundColor, 15),
                  SizedBox(
                    width: 30,
                  ),
                  customSubTitleText('৳${totalCost}', purpleColor, 17),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: CustomButton(
                buttonTitle: 'Confirm Payment',
                buONpress: () {
                  if (bankServerModel.Balance >= totalCost) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PropertyBuyFinalStep(
                            landSellModel: landSellModel,
                            bankServerModel: bankServerModel,
                            sellerAccountController:
                                sellerAccountController.text,
                            totalCost: totalCost),
                      ),
                    );
                  } else {
                    messageToast(context, 'Insufficient Balance');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
