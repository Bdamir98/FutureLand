import 'package:flutter/material.dart';
import 'package:home_land/provider/user_provider.dart';
import 'package:home_land/utils/constant.dart';
import 'package:home_land/views/widgets/custom_button.dart';
import 'package:home_land/views/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class UserProfileScreen extends StatefulWidget {
  UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Consumer<UserProvider>(
            builder: (context, value, child) {
              print("usr: ${value.userDataModel}");
              if (value.userDataModel != null) return newMethod(value, context);
              return Text("No Data");
            },
          ),
        ),
      ),
    );
  }

  Stack newMethod(UserProvider value, BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.6,
          child: Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: purpleColor,
              image: DecorationImage(
                image: NetworkImage(value.userDataModel!.UserPhoto ??
                    'https://imgs.search.brave.com/jroPHr6J3-xkvL0lLR4VKQHJ6YrUqtuCjTd99s-KRvQ/rs:fit:1200:800:1/g:ce/aHR0cHM6Ly9jLnN0/b2Nrc3kuY29tL2Ev/THF5NjAwL3o5LzE2/NjM4NTMuanBn'),
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
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color.fromARGB(38, 255, 255, 255),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: purpleColor,
                      ),
                    ),
                  )),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 140),
          child: Stack(
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
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.image,
                          color: purpleColor,
                        ),
                      ),
                    ),
                    radius: 47,
                    backgroundColor: purpleColor,
                    backgroundImage: NetworkImage(value
                            .userDataModel!.UserPhoto ??
                        'https://imgs.search.brave.com/jroPHr6J3-xkvL0lLR4VKQHJ6YrUqtuCjTd99s-KRvQ/rs:fit:1200:800:1/g:ce/aHR0cHM6Ly9jLnN0/b2Nrc3kuY29tL2Ev/THF5NjAwL3o5LzE2/NjM4NTMuanBn'),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 250, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customSubTitleText('Name', scaffoldBackgroundColor, 20),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color.fromARGB(255, 238, 237, 237),
                      ),
                      child: customTitleText(
                          value.userDataModel!.Name ?? 'Default Name',
                          purpleColor,
                          17),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customSubTitleText('Email', scaffoldBackgroundColor, 20),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color.fromARGB(255, 238, 237, 237),
                      ),
                      child: customTitleText(
                          value.userDataModel!.Email ?? 'Default Name',
                          purpleColor,
                          17),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customSubTitleText('Phone', scaffoldBackgroundColor, 20),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color.fromARGB(255, 238, 237, 237),
                      ),
                      child: customTitleText(
                          value.userDataModel!.Phone_Number ?? 'Default Name',
                          purpleColor,
                          17),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customSubTitleText(
                      'Present Address', scaffoldBackgroundColor, 20),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color.fromARGB(255, 238, 237, 237),
                      ),
                      child: customTitleText(
                          "${value.userDataModel!.Upozila},${value.userDataModel!.District}, ${value.userDataModel!.Division}",
                          purpleColor,
                          17),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customSubTitleText('Gender', scaffoldBackgroundColor, 20),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color.fromARGB(255, 238, 237, 237),
                      ),
                      child: customTitleText(
                          value.userDataModel!.Gender ?? 'Default Name',
                          purpleColor,
                          17),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: CustomButton(
                  buttonTitle: 'Update Profile',
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
