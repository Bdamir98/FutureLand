import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:home_land/constant.dart';
import 'package:home_land/firebase_options.dart';
import 'package:home_land/provider/land_post_provider.dart';
import 'package:provider/provider.dart';

import 'provider/auth_provider.dart';
import 'provider/firebase_database_provider.dart';
import 'screen/drawer_item_page/home_page/home_page.dart';
import 'services/auth_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => AuthProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => LandPostProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => MyNidCardData(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        canvasColor: Colors.white,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                minimumSize: Size.fromHeight(50),
                textStyle: TextStyle(fontSize: 14),
                backgroundColor: purpleColor)),
        hintColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          floatingLabelStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.transparent, width: 0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: canvasColor, width: 0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: purpleColor, width: 2),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          filled: true,
          fillColor: Color(0xff2C2F52),
          hintStyle: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      //home: AllMyProperty(),
      home: WillPopScope(
          onWillPop: () => AuthService.signOut(), child: HomePage()),
    );
  }
}
