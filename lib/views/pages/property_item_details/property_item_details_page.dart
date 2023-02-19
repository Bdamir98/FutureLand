import 'package:expandable_text/expandable_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:home_land/models/property_model.dart';
import 'package:home_land/utils/constant.dart';
import 'package:home_land/views/pages/property_buy/property_buy.dart';
import 'package:home_land/views/widgets/custom_button.dart';
import 'package:home_land/views/widgets/custom_text.dart';
import 'package:home_land/views/widgets/custom_text_field.dart';
import 'package:home_land/views/widgets/custom_toast.dart';

class PropertyItemDetailsPage extends StatelessWidget {
  PropertyItemDetailsPage({super.key, required this.landSellModel});
  LandSellModel landSellModel;
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Property Details'),
        centerTitle: true,
      ),
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            return SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: ImageSlideshow(
                          height: 200,
                          width: double.infinity,
                          isLoop: true,
                          autoPlayInterval: 5000,
                          indicatorColor: scaffoldBackgroundColor,
                          indicatorBackgroundColor: Colors.white,
                          children:
                              landSellModel.Property_Photo.map((propertyPhoto) {
                            return ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10),
                                  bottom: Radius.circular(10)),
                              child: Image.network(
                                propertyPhoto,
                                height: 140,
                                width: 190,
                                fit: BoxFit.cover,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          customTitleText(landSellModel.Property_Name,
                              scaffoldBackgroundColor, 17),
                          customTitleText(
                              '৳${landSellModel.Property_Price}', purpleColor),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 15,
                                color: purpleColor,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              customTitleText(landSellModel.Property_Location,
                                  scaffoldBackgroundColor, 17),
                            ],
                          ),
                          customTitleText('(${landSellModel.Property_Size})',
                              purpleColor, 13),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromARGB(80, 189, 188, 188)),
                              child: Column(
                                children: [
                                  customTitleText(
                                      'Dag No', scaffoldBackgroundColor, 15),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  customTitleText(
                                      landSellModel.Dag_No, purpleColor, 13),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromARGB(80, 189, 188, 188)),
                              child: Column(
                                children: [
                                  customTitleText(
                                      'Mouja No', scaffoldBackgroundColor, 15),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  customTitleText(
                                      landSellModel.Mouja_No, purpleColor, 13),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromARGB(80, 189, 188, 188)),
                              child: Column(
                                children: [
                                  customTitleText('Khotian No',
                                      scaffoldBackgroundColor, 15),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  customTitleText(landSellModel.Khotian_No,
                                      purpleColor, 13),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      customTitleText(
                          'Description', scaffoldBackgroundColor, 17),
                      SizedBox(
                        height: 5,
                      ),
                      ExpandableText(
                        landSellModel.Property_Description,
                        style: TextStyle(
                            fontSize: 13,
                            color: Color.fromARGB(197, 49, 49, 49),
                            fontWeight: FontWeight.w500),
                        expandText: 'Show More',
                        collapseText: 'Show Less',
                        maxLines: 4,
                        linkColor: Colors.blue,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(10),
                                bottom: Radius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(10),
                                    bottom: Radius.circular(10)),
                                child: Image.network(
                                  landSellModel.Seller_Photo,
                                  height: 60,
                                  width: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                landSellModel.Seller_Name,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: scaffoldBackgroundColor),
                              ),
                              Text(
                                landSellModel.Email,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: CustomButton(
                          buttonTitle: 'Buy Now',
                          buONpress: () async {
                            if (landSellModel.Email ==
                                FirebaseAuth.instance.currentUser!.email) {
                              messageToast(
                                  context, 'You Can not buy your property');
                            } else {
                              snapshot.hasData
                                  ? showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          actions: [
                                            CustomFormField(
                                              hintText: 'Enter Your Password',
                                              controller: passwordController,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                ElevatedButton(
                                                  child: Text("Cancel"),
                                                  onPressed: () {
                                                    passwordController.clear();
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                                ElevatedButton(
                                                  child: Text("Confirm"),
                                                  onPressed: () async {
                                                    try {
                                                      final credential = await FirebaseAuth
                                                          .instance
                                                          .signInWithEmailAndPassword(
                                                              email: FirebaseAuth
                                                                  .instance
                                                                  .currentUser!
                                                                  .email
                                                                  .toString(),
                                                              password:
                                                                  passwordController
                                                                      .text);
                                                      Navigator.pop(context);
                                                      Navigator.of(context)
                                                          .push(
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              PropertyBuy(
                                                                  landSellModel:
                                                                      landSellModel),
                                                        ),
                                                      );
                                                    } on FirebaseAuthException catch (e) {
                                                      if (e.code ==
                                                          'user-not-found') {
                                                        messageToast(context,
                                                            'User Not Found');
                                                      } else if (e.code ==
                                                          'wrong-password') {
                                                        messageToast(context,
                                                            'Incorrect Password');
                                                      }
                                                    }

                                                    passwordController.clear();
                                                  },
                                                ),
                                              ],
                                            )
                                          ],
                                        );
                                      },
                                    )
                                  : messageToast(context, 'Please Login First');
                            }
                          },
                        ),
                      ),
                      // Align(
                      //   alignment: Alignment.center,
                      //   child: CustomButton(
                      //     buttonTitle: 'Buy Now',
                      //     buONpress: () {
                      //       Navigator.of(context).push(
                      //         MaterialPageRoute(
                      //           builder: (context) => PropertyBuyPasswordMatch(
                      //               landSellModel: landSellModel),
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: [
                      //     Container(
                      //       height: 50,
                      //       width: 70,
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(10),
                      //         color: Color(0xff1D2343),
                      //       ),
                      //       child: Column(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: [
                      //           Icon(
                      //             Icons.chat,
                      //             size: 20,
                      //             color: Colors.green,
                      //           ),
                      //           SizedBox(
                      //             height: 5,
                      //           ),
                      //           Text(
                      //             'Message',
                      //             style: TextStyle(color: Colors.white),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //     Container(
                      //       height: 50,
                      //       width: 70,
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(10),
                      //         color: Color(0xff1D2343),
                      //       ),
                      //       child: Column(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: [
                      //           Icon(
                      //             Icons.phone,
                      //             size: 20,
                      //             color: Colors.deepOrangeAccent,
                      //           ),
                      //           SizedBox(
                      //             height: 5,
                      //           ),
                      //           Text(
                      //             'Phone',
                      //             style: TextStyle(color: Colors.white),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
