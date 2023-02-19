import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_land/provider/auth_provider.dart';
import 'package:home_land/utils/firebase_options.dart';
import 'package:provider/provider.dart';

import 'provider/otp_provider.dart';
import 'provider/user_provider.dart';
import 'views/pages/property_buy/property_buy_final_step/congratilatons_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => UserProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => AuthProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => OtpProvider(),
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
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return MaterialApp(
          // theme: ThemeData(
          //   canvasColor: Colors.white,
          //   textTheme: TextTheme(
          //     bodyLarge: TextStyle(color: Colors.white),
          //   ),
          //   outlinedButtonTheme: OutlinedButtonThemeData(
          //       style: OutlinedButton.styleFrom(
          //           foregroundColor: Colors.white,
          //           minimumSize: Size.fromHeight(50),
          //           textStyle: TextStyle(fontSize: 14),
          //           backgroundColor: purpleColor)),
          //   hintColor: Colors.white,
          //   inputDecorationTheme: InputDecorationTheme(
          //     floatingLabelStyle: TextStyle(color: Colors.white),
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(8),
          //       borderSide: BorderSide(color: Colors.transparent, width: 0),
          //     ),
          //     enabledBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(8),
          //       borderSide: BorderSide(color: canvasColor, width: 0),
          //     ),
          //     focusedBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(8),
          //       borderSide: BorderSide(color: purpleColor, width: 2),
          //     ),
          //     contentPadding:
          //         EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          //     filled: true,
          //     fillColor: Color(0xff2C2F52),
          //     hintStyle: TextStyle(
          //       color: Colors.white,
          //       fontSize: 14,
          //       fontWeight: FontWeight.w400,
          //     ),
          //   ),
          // ),
          debugShowCheckedModeBanner: false,
          home: CongratulationScreen(),
          //home: LatestPropertyView(),
          // home: WillPopScope(
          //     onWillPop: () => AuthService.signOut(), child: HomePage()),
        );
      },
    );
  }
}
