import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:home_land/models/property_model.dart';
import 'package:home_land/provider/user_provider.dart';
import 'package:home_land/utils/constant.dart';
import 'package:home_land/views/pages/user_property_details/user_property_details.dart';
import 'package:home_land/views/pages/user_property_sell/user_property_sell.dart';
import 'package:home_land/views/widgets/custom_text.dart';
import 'package:home_land/views/widgets/custom_toast.dart';
import 'package:provider/provider.dart';

class PropertySellScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final nidNumber = Provider.of<UserProvider>(context);
    final nidNum = nidNumber.nidNumber;
    final usersQuery = FirebaseFirestore.instance
        .collection('Land_Server')
        .where('Nid_Number', isEqualTo: nidNum)
        .withConverter<LandServerModel>(
          fromFirestore: (snapshot, _) =>
              LandServerModel.fromJson(snapshot.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: purpleColor,
        title: customTitleText('Property Sell', Colors.white, 18),
        centerTitle: true,
      ),
      body: FirestoreQueryBuilder(
        query: usersQuery,
        builder: (context, snapshot, child) {
          if (!snapshot.hasData) {
            print(snapshot.docs);
            return Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/nopost.png',
                        height: 200,
                      ),
                      customSubTitleText(
                          'No Post Available', scaffoldBackgroundColor, 20),
                      customSubTitleText(
                          'All your post available here after uploading',
                          Colors.grey,
                          12),
                    ]),
              ),
            );
          }
          return ListView.builder(
            itemCount: snapshot.docs.length,
            itemBuilder: (context, index) {
              final userData = snapshot.docs[index].data();
              return Padding(
                padding: EdgeInsets.all(10),
                child: Card(
                  color: Color.fromARGB(209, 255, 255, 255),
                  //margin: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10)), //<--custom shape
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(10),
                              bottom: Radius.circular(10)),
                          child: Image.network(
                            userData.Land_Photo[0],
                            height: 100,
                            width: 110,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                customTitleText(
                                    userData.Property_Name, purpleColor, 14),
                                Icon(
                                  Icons.favorite,
                                  color: scaffoldBackgroundColor,
                                  size: 16,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: scaffoldBackgroundColor,
                                  size: 14,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                customSubTitleText(
                                    userData.Land_Location, purpleColor, 12),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.account_balance,
                                  color: scaffoldBackgroundColor,
                                  size: 14,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                customSubTitleText(
                                    userData.Property_Size, purpleColor, 12),
                              ],
                            ),
                            customSubTitleText(
                                userData.Availability,
                                userData.Availability == 'Available'
                                    ? Colors.green
                                    : Colors.red),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            UserPropertyDetailsPage(
                                                userData: userData),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: 25,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: scaffoldBackgroundColor),
                                    child: Center(
                                      child: Text(
                                        'Details',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    if (userData.Availability == 'Available') {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              UserPropertySellPage(
                                                  userData: userData),
                                        ),
                                      );
                                    } else {
                                      messageToast(
                                          context, 'Property Alreday Sold');
                                    }
                                  },
                                  child: Container(
                                    height: 25,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: purpleColor),
                                    child: Center(
                                      child: Text(
                                        'Sell ',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
