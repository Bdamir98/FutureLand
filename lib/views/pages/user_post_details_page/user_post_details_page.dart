import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:home_land/models/property_model.dart';
import 'package:home_land/utils/constant.dart';
import 'package:home_land/views/widgets/custom_text.dart';

class UserPostDetailsPage extends StatelessWidget {
  UserPostDetailsPage({super.key, required this.landSellModel});
  LandSellModel landSellModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Property Details'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                  children: landSellModel.Property_Photo.map((propertyPhoto) {
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
                  customTitleText(
                      landSellModel.Property_Name, scaffoldBackgroundColor, 17),
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
                  customTitleText(
                      '(${landSellModel.Property_Size})', purpleColor, 13),
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
                          customTitleText(
                              'Khotian No', scaffoldBackgroundColor, 15),
                          SizedBox(
                            height: 5,
                          ),
                          customTitleText(
                              landSellModel.Khotian_No, purpleColor, 13),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              customTitleText('Description', scaffoldBackgroundColor, 17),
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
                height: 10,
              ),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10), bottom: Radius.circular(10)),
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
            ],
          ),
        ),
      ),
    );
  }
}
