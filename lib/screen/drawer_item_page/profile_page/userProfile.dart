import 'package:flutter/material.dart';
import 'package:home_land/constant.dart';
import 'package:home_land/custom_widget/custom_text.dart';
import 'package:home_land/provider/firebase_database_provider.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatelessWidget {
  UserProfile({super.key});
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<MyNidCardData>(
      builder: (context, value, child) {
        final userData = value.userData;
        if (userData != null) {
          return Stack(
            children: [
              Opacity(
                opacity: 0.7,
                child: Container(
                  height: 200,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: purpleColor,
                    image: DecorationImage(
                      image: NetworkImage(userData["UserPhoto"]),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Stack(
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: purpleColor,
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 2.8),
                      child: CircleAvatar(
                        radius: 47,
                        backgroundColor: purpleColor,
                        backgroundImage: NetworkImage(userData["UserPhoto"]),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 280, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText('Name', purpleColor, 20, FontWeight.bold),
                        SizedBox(
                          height: 5,
                        ),
                        customText(
                            userData['Name'], scaffoldBackgroundColor, 20),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText('Email', purpleColor, 20, FontWeight.bold),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customText(
                                userData['Email'], scaffoldBackgroundColor, 20),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText('Gender', purpleColor, 20, FontWeight.bold),
                        SizedBox(
                          height: 5,
                        ),
                        customText(
                            userData['Gender'], scaffoldBackgroundColor, 20),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText('Address', purpleColor, 20, FontWeight.bold),
                        SizedBox(
                          height: 5,
                        ),
                        customText(
                            "${userData['District']}, ${userData['Division']}",
                            scaffoldBackgroundColor,
                            20),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText('Phone', purpleColor, 20, FontWeight.bold),
                        SizedBox(
                          height: 5,
                        ),
                        customText("${userData['Phone_Number']}",
                            scaffoldBackgroundColor, 20),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        } else {
          Text('Data Not Found');
        }
        return CircularProgressIndicator();
      },
    ));
  }
}
