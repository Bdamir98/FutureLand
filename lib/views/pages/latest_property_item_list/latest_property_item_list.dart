import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:home_land/models/property_model.dart';
import 'package:home_land/views/pages/property_item_details/property_item_details_page.dart';
import 'package:home_land/views/widgets/custom_text.dart';
import 'package:home_land/views/widgets/custom_toast.dart';
import 'package:intl/intl.dart';

class LatestPropertyItem extends StatelessWidget {
  LatestPropertyItem({super.key});
  final usersQuery = FirebaseFirestore.instance
      .collection('All_Property_Post')
      .withConverter<LandSellModel>(
        fromFirestore: (snapshot, _) =>
            LandSellModel.fromJson(snapshot.data()!),
        toFirestore: (user, _) => user.toJson(),
      );
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      child: FirestoreQueryBuilder(
        query: usersQuery,
        builder: (context, snapshot, child) {
          if (snapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.docs.length,
              itemBuilder: (context, index) {
                LandSellModel landSellModel = snapshot.docs[index].data();
                return InkWell(
                  onTap: () async {
                    if (landSellModel.Availability == 'Available') {
                      final newData = landSellModel.Popularity + 1;
                      await FirebaseFirestore.instance
                          .collection("All_Property_Post")
                          .doc(snapshot.docs[index].id)
                          .update({
                        // Update the data here, for example:
                        "Popularity": newData,
                      });
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
                    color: Color(0xff282B4A),
                    margin: EdgeInsets.only(right: 8, bottom: 24),
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20)), //<--custom shape
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                              bottom: Radius.circular(20)),
                          child: Image.network(
                            landSellModel.Property_Photo[0],
                            height: 140,
                            width: 190,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              landSellModel.Property_Name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 12),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Text(
                              '৳${landSellModel.Property_Price}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        //SizedBox(height: 10),
                        Row(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.apps,
                                  color: Colors.orange,
                                ),
                                SizedBox(width: 3),
                                Text(
                                  landSellModel.Property_Size,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 10),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            customSubTitleText(
                                landSellModel.Availability,
                                landSellModel.Availability == 'Available'
                                    ? Colors.green
                                    : Colors.red,
                                13),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.access_time,
                              color: Colors.orange,
                              size: 14,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            customSubTitleText('Added Date:', Colors.white, 10),
                            SizedBox(
                              width: 15,
                            ),
                            customSubTitleText(
                                DateFormat('yyyy-MM-dd')
                                    .format(landSellModel.Added_Date.toDate()),
                                Colors.orange,
                                12),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Text('Data Not Found');
        },
      ),
    );
  }
}
