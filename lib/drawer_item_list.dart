import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:home_land/provider/user_provider.dart';
import 'package:home_land/views/screens/notification_screen/notification_screen.dart';
import 'package:home_land/views/screens/property_sell_screen/property_sell_screen.dart';
import 'package:home_land/views/widgets/custom_text.dart';
import 'package:provider/provider.dart';

import 'provider/auth_provider.dart';
import 'utils/constant.dart';
import 'views/pages/user_login_page/user_login_page.dart';
import 'views/screens/my_bank_account/my_bank_account.dart';
import 'views/screens/my_post/my_property_sell_post.dart';
import 'views/screens/user_profile_screen/user_profile_screens.dart';

class DrawerItemList extends StatelessWidget {
  DrawerItemList({Key? key}) : super(key: key);
  final currentUser = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    return SafeArea(
      child: SizedBox(
        width: 220,
        child: Drawer(
          backgroundColor: purpleColor,
          child: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Container(
                        height: 150,
                        width: double.infinity,
                        color: scaffoldBackgroundColor,
                        child: DrawerHeader(
                          child: Consumer<UserProvider>(
                            builder: (context, value, child) {
                              if (value.userDataModel == null) {}
                              return Column(
                                children: [
                                  CircleAvatar(
                                    radius: 35,
                                    backgroundImage: NetworkImage(
                                      value.userDataModel!.UserPhoto ??
                                          'https://docs.flutter.dev/assets/images/flutter-logo-sharing.png',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  customTitleText(
                                      value.userDataModel!.Name ??
                                          'Default Name',
                                      Colors.white),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  customTitleText(
                                      value.userDataModel!.Email ??
                                          'Default Name',
                                      Colors.white)
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.home,
                          color: scaffoldBackgroundColor,
                        ),
                        title: Text('Home'),
                        onTap: () {},
                      ),
                      Divider(
                        height: 1,
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.person,
                          color: scaffoldBackgroundColor,
                        ),
                        title: Text('Profile'),
                        onTap: () {
                          // Navigate to the User Profile screen
                          //context.read<UserProvider>().getUserDataFromModel();
                          Navigator.pop(context);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => UserProfileScreen(),
                            ),
                          );
                        },
                      ),
                      Divider(height: 2),
                      ListTile(
                        leading: Icon(
                          Icons.business,
                          color: scaffoldBackgroundColor,
                        ),
                        title: Text('Property Sell'),
                        onTap: () {
                          // Show Current User All Property For Sell
                          Navigator.pop(context);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PropertySellScreen(),
                            ),
                          );
                        },
                      ),
                      Divider(height: 2),
                      ListTile(
                        leading: Icon(
                          Icons.style,
                          color: scaffoldBackgroundColor,
                        ),
                        title: Text('My Post'),
                        onTap: () {
                          // Navigate to the My Sell Post screen to show my all post
                          Navigator.pop(context);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => MySellPost(),
                            ),
                          );
                        },
                      ),
                      Divider(
                        height: 2,
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.notifications,
                          color: scaffoldBackgroundColor,
                        ),
                        title: Text('Notifications'),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => NotificationScreen(),
                            ),
                          );
                        },
                      ),
                      Divider(
                        height: 2,
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.account_balance,
                          color: scaffoldBackgroundColor,
                        ),
                        title: Text('My Bank Account'),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => MyBankAccount(),
                            ),
                          );
                        },
                      ),
                      Divider(
                        height: 2,
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.logout,
                          color: scaffoldBackgroundColor,
                        ),
                        title: Text('Log Out'),
                        onTap: () {
                          Navigator.pop(context);
                          authProvider.signOut();
                          //userProvider.resetData();
                        },
                      ),
                      Divider(
                        height: 1,
                      ),
                    ],
                  );
                }
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customTitleText('Please Login Here', Colors.white, 15),
                      ElevatedButton.icon(
                          style: ButtonStyle(
                              shadowColor: MaterialStateProperty.all(
                                  scaffoldBackgroundColor),
                              backgroundColor: MaterialStateProperty.all(
                                  scaffoldBackgroundColor)),
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => UserLoginPage(),
                              ),
                            );
                          },
                          icon: Icon(Icons.lock),
                          label: Text('Log In'))
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
