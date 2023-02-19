import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_land/drawer_item_list.dart';
import 'package:home_land/provider/user_provider.dart';
import 'package:home_land/utils/constant.dart';
import 'package:home_land/views/pages/latest_property_item_list/latest_property_item_list.dart';
import 'package:home_land/views/pages/popular_property_item_list/popular_property_item_list.dart';
import 'package:home_land/views/screens/home_screen/components/latest_property_label.dart';
import 'package:home_land/views/screens/home_screen/components/popular_property_label.dart';
import 'package:home_land/views/widgets/custom_text.dart';
import 'package:home_land/views/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> getUserDataFromModel() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      await userProvider.getUserDataFromModel();
    }
  }

  Future<void> getUserData() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      await userProvider.getUserData();
    }
  }

  @override
  void initState() {
    getUserData();
    getUserDataFromModel();
    super.initState();
  }

  void dispose() {
    // Use the reference to the ancestor widget safely in dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: purpleColor,
              title: Text('Home'),
              centerTitle: true,
            ),
            drawer: DrawerItemList(),
            body: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customSubTitleText(
                          'A Secure Way to', scaffoldBackgroundColor, 13),
                      customTitleText(
                          'Buy And Sell Property', Colors.green, 16),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomFormField(
                          hintText: 'Search Here', icons: Icons.search),
                      SizedBox(
                        height: 5.h,
                      ),
                      LatestPropertyLabel(),

                      SizedBox(
                        height: 5.h,
                      ),

                      LatestPropertyItem(),
                      PopularPropertyLabel(),

                      SizedBox(
                        height: 10.h,
                      ),
                      //LatestPropertyView(),
                      PopularPropertyItem()
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
