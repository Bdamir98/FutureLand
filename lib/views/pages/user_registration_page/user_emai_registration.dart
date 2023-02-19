import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:home_land/provider/auth_provider.dart';
import 'package:home_land/provider/user_provider.dart';
import 'package:home_land/views/screens/home_screen/home_screen.dart';
import 'package:home_land/views/widgets/custom_button.dart';
import 'package:home_land/views/widgets/custom_text_field.dart';
import 'package:home_land/views/widgets/custom_toast.dart';
import 'package:home_land/views/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class UserEmailPasswordRegistration extends StatelessWidget {
  final Map<String, dynamic> nidSnapshot;

  final TextEditingController nidData = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  var Gender;
  final CollectionReference users =
      FirebaseFirestore.instance.collection('Users');
  UserEmailPasswordRegistration({super.key, required this.nidSnapshot});
  Future<void> addUser() async {
    String _name = nidSnapshot['Name'];
    String _fatherName = nidSnapshot['Father_Name'];
    String _motherName = nidSnapshot['Mother_Name'];
    Timestamp timestamp = nidSnapshot['Date_of_Birth'];
    String _nidNumber = nidSnapshot['Nid_Number'];
    String _district = nidSnapshot['District'];
    String _division = nidSnapshot['Division'];
    String _phone = nidSnapshot['Phone_Number'];
    String _userPhoto = nidSnapshot['Nid_Photo'];
    try {
      if (email.text.isEmpty && pass.text.isEmpty) {
        contextMessageToast('Enter Email And Password');
      } else if (email.text.isEmpty) {
        contextMessageToast('Enter Your Email');
      } else if (pass.text.isEmpty) {
        contextMessageToast('Enter Your Password');
      } else {
        FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: email.text.toString(),
          password: pass.text.toString(),
        )
            .then((UserCredential userCredential) {
          String uid = userCredential.user!.uid;
          users.doc(uid).set({
            'Email': email.text,
            'Name': _name,
            'Gender': Gender,
            'Father_Name': _fatherName,
            'Mother_Name': _motherName,
            'Date_of_Birth': timestamp,
            'Nid_Number': _nidNumber,
            'District': _district,
            'Division': _division,
            'Phone_Number': _phone,
            'UserPhoto': _userPhoto,
          });
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        contextMessageToast('Weak Password');
      } else if (e.code == 'email-already-in-use') {
        contextMessageToast('Email Already Use');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final _auth = Provider.of<AuthProvider>(context);
    Gender = _auth.genderGroupValue;
    TextEditingController myController = TextEditingController();
    myController.text = '${nidSnapshot['Nid_Number']}';
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/SignUp.png',
              height: 350,
              width: 350,
            ),
            CustomFormField(
              hintText: 'Email',
              controller: email,
              keyboard: TextInputType.emailAddress,
            ),
            CustomFormField(
              hintText: 'Password',
              controller: pass,
              textLines: 1,
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Gender',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Consumer<AuthProvider>(
                        builder: (context, authPro, child) => Radio<String>(
                          value: 'Male',
                          groupValue: authPro.genderGroupValue,
                          onChanged: (value) {
                            authPro.setGenderGroupValue(value!);
                          },
                        ),
                      ),
                      const Text('Male',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                  Row(
                    children: [
                      Consumer<AuthProvider>(
                        builder: (context, authPro, child) => Radio<String>(
                          value: 'Female',
                          groupValue: authPro.genderGroupValue,
                          onChanged: (value) {
                            authPro.setGenderGroupValue(value!);
                          },
                        ),
                      ),
                      const Text('Female',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ],
              ),
            ),
            CustomButton(
                buttonTitle: 'Registration',
                buONpress: () {
                  if (email.text.isEmpty) {
                    messageToast(context, 'Please Enter Your Email');
                  } else if (pass.text.isEmpty) {
                    messageToast(context, 'Please Enter Password');
                  } else {
                    // AuthService.signUpUser(
                    //     email.text.toString(), pass.text.toString());
                    showLoadingDialog(context);
                    addUser().then((value)async{
                    await  context.read<UserProvider>().getUserData();
                     await context.read<UserProvider>().getUserDataFromModel();
                      Navigator.pop(context);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    });
                  }
                }),
          ],
        ),
      ),
    );
  }
}
