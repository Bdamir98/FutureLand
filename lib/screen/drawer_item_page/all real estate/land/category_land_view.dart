import 'package:flutter/material.dart';
import 'package:home_land/Models/land_view_model.dart';
import 'package:home_land/screen/drawer_item_page/all%20real%20estate/land/component/all_new_land_list.dart';
import 'package:home_land/screen/drawer_item_page/all%20real%20estate/land/component/land_details_page.dart';

class CategoryLandPage extends StatefulWidget {
  CategoryLandPage({super.key});

  @override
  State<CategoryLandPage> createState() => _CategoryLandPageState();
}

class _CategoryLandPageState extends State<CategoryLandPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 270,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LandDetailsPage(
                        landetails: HouseListViewModel.houselist[index]),
                  ));
                },
                child: Card(
                    color: Color(0xff282B4A),
                    margin: EdgeInsets.only(left: 8, right: 8, bottom: 24),
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20)), //<--custom shape
                    child: Column(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                              bottom: Radius.circular(20)),
                          child: Image.asset(
                            HouseListViewModel.houselist[index].hthumbnail!,
                            height: 170,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              HouseListViewModel.houselist[index].htitle!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Text(
                              '${HouseListViewModel.houselist[index].hprice!}',
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
                              Icons.apps,
                              color: Colors.orange,
                            ),
                            SizedBox(width: 3),
                            Text(
                              HouseListViewModel.houselist[index].hspace!
                                  .toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 10),
                            ),
                          ],
                        ),
                      ],
                    )),
              );
            },
          ),
        ),
        
      ],
    );
  }
}
