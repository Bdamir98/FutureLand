import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:home_land/constant.dart';
import 'package:home_land/custom_widget/custom_text.dart';
import 'package:home_land/provider/auth_provider.dart';
import 'package:home_land/provider/firebase_database_provider.dart';
import 'package:home_land/screen/drawer_item_page/create_post/all_my_property.dart';
import 'package:home_land/screen/drawer_item_page/profile_page/userProfile.dart';
import 'package:provider/provider.dart';

class DrawerItemList extends StatelessWidget {
  DrawerItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<AuthProvider>(context);
    final firebaseProvider = Provider.of<MyNidCardData>(context);
    return Drawer(
      backgroundColor: canvasColor,
      child: Column(
        children: [
          Container(
            height: 200,
            child: DrawerHeader(
                child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('Users')
                  .where('Email',
                      isEqualTo: FirebaseAuth.instance.currentUser!.email)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      if (snapshot.hasData && snapshot.data != null) {
                        final userData = snapshot.data!.docs[index].data();
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage:
                                  NetworkImage(userData['UserPhoto']),
                            ),
                            SizedBox(height: 10),
                            customText(userData['Name'], purpleColor),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(userData['Email']),
                              ],
                            ),
                          ],
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  );
                }
                return Center(
                  child: Text('There is no Data'),
                );
              },
            )),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.deepOrange,
            ),
            title: Text('Home'),
            onTap: () {},
          ),
          Consumer<MyNidCardData>(
            builder: (context, value, child) {
              return ListTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.deepOrange,
                ),
                title: Text('Profile'),
                onTap: () {
                  value.userinfoByPhone();
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => UserProfile(),
                  ));
                },
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.sell,
              color: Colors.deepOrange,
            ),
            title: Text('My Property'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AllMyProperty(),
              ));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.favorite,
              color: Colors.deepOrange,
            ),
            title: Text('Favorites'),
            onTap: () {
              // Navigate to the home screen
            },
          ),
          ListTile(
            leading: Icon(
              Icons.chat,
              color: Colors.deepOrange,
            ),
            title: Text('Help'),
            onTap: () {
              // Navigate to the home screen
            },
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Colors.deepOrange,
            ),
            title: Text('Log Out'),
            onTap: () {
              Navigator.pop(context);
              userProvider.signOut();
            },
          ),
        ],
      ),
    );
  }
}
