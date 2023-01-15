import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_land/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class CustomNamePhoto extends StatelessWidget {
  const CustomNamePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    final _authProvider = Provider.of<AuthProvider>(context);
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      initialData: FirebaseAuth.instance.currentUser,
      builder: (context, snapshot) {
        return Padding(
          padding: const EdgeInsets.only(left: 20, right: 15),
          child: Consumer<AuthProvider>(
            builder: (context, value, child) {
              return Visibility(
                visible:
                    FirebaseAuth.instance.currentUser != null ? true : false,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello!',
                          style: GoogleFonts.roboto(
                              fontSize: 15, color: Colors.black),
                        ),
                        Text(
                          'Amir Hossain',
                          style: GoogleFonts.nunito(
                              fontSize: 23,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    ClipRRect(
                      child: Image.asset(
                        'assets/logo.png',
                        height: 70,
                        width: 70,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
