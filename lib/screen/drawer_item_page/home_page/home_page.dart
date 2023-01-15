import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_land/constant.dart';
import 'package:home_land/screen/drawer_item_page/home_page/component/latest_property.dart';
import 'package:home_land/screen/drawer_item_page/home_page/component/latest_property_item.dart';
import 'package:home_land/screen/drawer_item_page/home_page/component/name_avatar.dart';
import 'package:home_land/screen/drawer_menu/drawer_item_list.dart';
import 'package:home_land/screen/user_login_registration/signIn_signOut.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      initialData: FirebaseAuth.instance.currentUser,
      builder: (context, snapshot) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            leading: Builder(
              builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                  )),
            ),
            title: Text(
              'FutureLand',
              style: GoogleFonts.nunito(
                  color: canvasColor, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            actions: [
              snapshot.hasData
                  ? Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.notifications,
                        color: Colors.black,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignInAndSignOut(),
                          ));
                        },
                        child: Container(
                          width: 80,
                          decoration: BoxDecoration(
                              color: purpleColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(child: Text('Sign Up')),
                        ),
                      ),
                    ),
            ],
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          drawer: Visibility(
            visible: snapshot.hasData ? true : false,
            child: SizedBox(
              width: 230,
              child: DrawerItemList(),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 65),
            child: Column(
              children: [
                CustomNamePhoto(),
                SizedBox(
                  height: 10,
                ),
                LatestProperty(),
                SizedBox(
                  height: 10,
                ),
                LatestPropertyItemList(),
              ],
            ),
          ),
        );
      },
    );
  }
}
