import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:home_land/models/bank_model.dart';
import 'package:home_land/models/property_model.dart';
import 'package:home_land/provider/user_provider.dart';
import 'package:home_land/services/firebase_query/property_services.dart';
import 'package:home_land/utils/constant.dart';
import 'package:home_land/views/pages/property_buy/ssl_payment.dart';
import 'package:home_land/views/widgets/custom_text.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';

class PropertyBuyFinalStep extends StatelessWidget {
  PropertyBuyFinalStep(
      {super.key,
      required this.landSellModel,
      required this.bankServerModel,
      required this.sellerAccountController,
      required this.totalCost});
  final LandSellModel landSellModel;
  final BankServerModel bankServerModel;
  final String sellerAccountController;
  final double totalCost;
  @override
  Widget build(BuildContext context) {
    final buyerProvider = Provider.of<UserProvider>(context);
    DateTime now = DateTime.now();
    final formated = DateFormat('EEEE, MMM d, yyyy').format(now);
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Status'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/payment.png',
                  height: 200,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 380,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(193, 228, 225, 225),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      customSubTitleText(
                          'Confirm the payment', scaffoldBackgroundColor, 22),
                      SizedBox(
                        height: 10,
                      ),
                      customSubTitleText('See All the details',
                          Color.fromARGB(181, 104, 103, 103), 18),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customSubTitleText(
                              'Date',
                              scaffoldBackgroundColor,
                              18,
                            ),
                            customSubTitleText(formated, purpleColor, 15),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customSubTitleText(
                              'Payment Method',
                              scaffoldBackgroundColor,
                              18,
                            ),
                            customSubTitleText(
                                bankServerModel.Bank_Name, purpleColor, 15),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customSubTitleText('Recipient Account',
                                scaffoldBackgroundColor, 18),
                            customSubTitleText(
                                sellerAccountController, purpleColor, 15),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customSubTitleText(
                                'Transfer Amount', scaffoldBackgroundColor, 18),
                            customSubTitleText(
                                '৳${totalCost}', purpleColor, 15),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: ConfirmationSlider(
                          text: 'Confirm the Payment',
                          textStyle: TextStyle(
                              color: scaffoldBackgroundColor,
                              fontWeight: FontWeight.bold),
                          onConfirmation: () async {
                            showLoadingDialog(context);
                            final myAccountNumber = bankServerModel.Account_No;
                            final senderName =
                                bankServerModel.Account_Holder_Name;
                            final pName = landSellModel.Property_Name;
                            final pSize = landSellModel.Property_Size;
                            final pPrice = landSellModel.Property_Price;
                            final pLocation = landSellModel.Property_Location;
                            final List<dynamic> pPhoto = [
                              landSellModel.Property_Photo[0]
                            ];
                            final dagNo = landSellModel.Dag_No;
                            final khotianNo = landSellModel.Khotian_No;
                            final moujaNo = landSellModel.Mouja_No;
                            final sellerName = landSellModel.Seller_Name;
                            final sellerNid = landSellModel.Nid_Number;
                            final landId = landSellModel.Land_Id;
                            final sellerEmail = landSellModel.Email;
                            final buyerEmail =
                                buyerProvider.userDataModel!.Email;
                            final paymentMethod = bankServerModel.Bank_Name;
                            final formate =
                                DateFormat('yyyy-MM-dd').format(now);
                            final addedDate =
                                Timestamp.fromDate(DateTime.parse(formate));

                            print(myAccountNumber);
                            int newAmount = totalCost.toInt();
                            PropertyServices().transferMoney(
                                sellerAccountController,
                                myAccountNumber,
                                newAmount);
                            PropertyServices().paymentDetailsStore(
                                senderName,
                                sellerAccountController,
                                newAmount,
                                pName,
                                pSize,
                                pPrice,
                                pLocation,
                                dagNo,
                                khotianNo,
                                moujaNo,
                                sellerName,
                                sellerEmail,
                                buyerEmail!,
                                paymentMethod,
                                landId,
                                pPhoto,
                                addedDate);
                            final ownerName = buyerProvider.userDataModel!.Name;
                            final ownerPhone =
                                buyerProvider.userDataModel!.Phone_Number;
                            final ownerFather =
                                buyerProvider.userDataModel!.Father_Name;
                            final ownerMother =
                                buyerProvider.userDataModel!.Mother_Name;
                            final ownerNid =
                                buyerProvider.userDataModel!.Nid_Number;
                            PropertyServices().ownerShipTransfer(
                              ownerName!,
                              pName,
                              pSize,
                              pLocation,
                              pPhoto,
                              ownerPhone!,
                              dagNo,
                              moujaNo,
                              khotianNo,
                              ownerFather!,
                              ownerMother!,
                              ownerNid!,
                            );
                            PropertyServices().sellerLandServerUpdate(landId);
                            PropertyServices().propertySoldOut(landId);
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SslcommerzPayment(
                                  bankServerModel: bankServerModel,
                                  landSellModel: landSellModel,
                                  sellerAccountController:
                                      sellerAccountController,
                                  totalCost: totalCost),
                            ));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
