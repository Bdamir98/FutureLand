import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:home_land/Models/land_view_model.dart';
import 'package:home_land/constant.dart';

class LandDetailsPage extends StatelessWidget {
  LandDetailsPage({required this.landetails});
final  HouseListViewModel landetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1D1E3A),
        title: Text(landetails.htitle!),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xff282B4A),
                        borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.all(10),
                    child: ClipRRect(
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
                            landetails.hthumbnail!,
                            height: 250,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        Text(
                          "${landetails.hprice!}",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlue),
                        ),
                        SizedBox(height: 40),
                        Text(
                          "Description",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: canvasColor),
                        ),
                        SizedBox(height: 10),
                        ExpandableText(
                          landetails.hdescription!,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                              color: canvasColor),
                          expandText: 'show more',
                          collapseText: 'show less',
                          maxLines: 3,
                          linkColor: Colors.blue,
                        ),
                      ],
                    ),
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
                            child: Image.asset(
                              landetails.huserphoto!,
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
                            landetails.husername!,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            landetails.huseremail!,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 70,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff1D2343),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.chat,
                              size: 30,
                              color: Colors.green,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Message',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 70,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff1D2343),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.phone,
                              size: 30,
                              color: Colors.deepOrangeAccent,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Phone',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
