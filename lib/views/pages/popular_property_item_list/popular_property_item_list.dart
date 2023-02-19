import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:home_land/models/property_model.dart';
import 'package:home_land/utils/constant.dart';
import 'package:home_land/views/pages/property_item_details/property_item_details_page.dart';
import 'package:home_land/views/widgets/custom_text.dart';
import 'package:home_land/views/widgets/custom_toast.dart';
import 'package:intl/intl.dart';

class PopularPropertyItem extends StatelessWidget {
  PopularPropertyItem({super.key});
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
    return Container(
      height: 280,
      child: FirestoreQueryBuilder(
        query: usersQuery,
        builder: (context, snapshot, child) {
          if (snapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: snapshot.docs.length,
              itemBuilder: (context, index) {
                LandSellModel landSellModel = snapshot.docs[index].data();
                return InkWell(
                  onTap: () {
                    if (landSellModel.Availability == 'Available') {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PropertyItemDetailsPage(
                              landSellModel: landSellModel),
                        ),
                      );
                    } else {
                      messageToast(context, 'This Property Already Sold Out');
                    }
                  },
                  child: Card(
                    color: Color.fromARGB(234, 239, 240, 239),
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
                              landSellModel.Property_Photo[0],
                              height: 100,
                              width: 83,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customTitleText(
                                  landSellModel.Property_Name, purpleColor, 16),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: scaffoldBackgroundColor,
                                    size: 17,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  customSubTitleText(
                                      landSellModel.Property_Location,
                                      purpleColor,
                                      14),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.account_balance,
                                        color: scaffoldBackgroundColor,
                                        size: 17,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      customSubTitleText(
                                          landSellModel.Property_Size,
                                          purpleColor,
                                          14),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  customSubTitleText(
                                      landSellModel.Availability,
                                      landSellModel.Availability == 'Available'
                                          ? Colors.green
                                          : Colors.red,
                                      13),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    color: scaffoldBackgroundColor,
                                    size: 17,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text('Added Date:'),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  customSubTitleText(
                                      DateFormat('yyyy-MM-dd').format(
                                          landSellModel.Added_Date.toDate()),
                                      purpleColor,
                                      14),
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
          }
          return Text('data');
        },
      ),
    );
  }
}
