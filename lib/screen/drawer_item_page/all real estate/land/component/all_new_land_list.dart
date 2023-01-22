import 'package:flutter/material.dart';
import 'package:home_land/Models/land_view_model.dart';
import 'package:home_land/constant.dart';
import 'package:home_land/screen/drawer_item_page/all%20real%20estate/land/component/land_details_page.dart';

import 'see_all_latest_poperty.dart';

class AllnewLandLIst extends StatefulWidget {
  const AllnewLandLIst({Key? key}) : super(key: key);

  @override
  State<AllnewLandLIst> createState() => _AllnewLandLIstState();
}

class _AllnewLandLIstState extends State<AllnewLandLIst> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 10),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Latest Property ',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: canvasColor),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SeeAllLatestProperty()));
                  },
                  child: Text(
                    'See All ',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.green),
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.green,
              height: 200,
              child: ListView.builder(
                //physics: ScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LandDetailsPage(
                              landetails: HouseListViewModel.houselist[index]),
                        ),
                      );
                    },
                    child: Card(
                      color: Color(0xff282B4A),
                      //margin: EdgeInsets.only(right: 8, bottom: 24),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                                bottom: Radius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                    bottom: Radius.circular(20)),
                                child: Image.asset(
                                  HouseListViewModel
                                      .houselist[index].hthumbnail!,
                                  height: 80,
                                  width: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          //SizedBox(height: 20),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        HouseListViewModel
                                            .houselist[index].htitle!,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 16),
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Text(
                                        ' ${HouseListViewModel.houselist[index].hprice!}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.orange,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_sharp,
                                        color: Colors.orange,
                                        size: 15,
                                      ),
                                      SizedBox(width: 3),
                                      Text(
                                        HouseListViewModel
                                            .houselist[index].hlocation!,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.grey,
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.apps,
                                            color: Colors.orange,
                                          ),
                                          SizedBox(width: 3),
                                          Text(
                                            HouseListViewModel
                                                .houselist[index].hspace!
                                                .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
