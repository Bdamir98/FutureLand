import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:home_land/models/property_model.dart';
import 'package:home_land/utils/constant.dart';
import 'package:home_land/views/pages/property_item_details/property_item_details_page.dart';
import 'package:home_land/views/widgets/custom_text.dart';
import 'package:intl/intl.dart';

class PopularPropertySellAllList extends StatelessWidget {
  PopularPropertySellAllList({super.key});

  final usersQuery = FirebaseFirestore.instance
      .collection('All_Property_Post')
      .orderBy('Popularity', descending: true)
      .withConverter<LandSellModel>(
        fromFirestore: (snapshot, _) =>
            LandSellModel.fromJson(snapshot.data()!),
        toFirestore: (user, _) => user.toJson(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Popular Property'),
        centerTitle: true,
      ),
      body: Container(
        height: 700,
        child: FirestoreListView(
          scrollDirection: Axis.vertical,
          query: usersQuery,
          itemBuilder: (context, snapshot) {
            LandSellModel userData = snapshot.data();
            return InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      PropertyItemDetailsPage(landSellModel: userData),
                ));
              },
              child: Padding(
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
                            userData.Property_Photo[0],
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
                            customTitleText(
                                userData.Property_Name, purpleColor, 14),
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
                                customSubTitleText(userData.Property_Location,
                                    purpleColor, 12),
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
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.access_time,
                                  color: scaffoldBackgroundColor,
                                  size: 14,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                customSubTitleText(
                                    'Added Date', Colors.black, 12),
                                SizedBox(
                                  width: 5,
                                ),
                                customSubTitleText(
                                    DateFormat('yyyy-MM-dd')
                                        .format(userData.Added_Date.toDate()),
                                    purpleColor,
                                    12),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
