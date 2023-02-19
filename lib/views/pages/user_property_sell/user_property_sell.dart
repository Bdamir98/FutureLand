import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:home_land/models/property_model.dart';
import 'package:home_land/provider/user_provider.dart';
import 'package:home_land/utils/constant.dart';
import 'package:home_land/views/screens/home_screen/home_screen.dart';
import 'package:home_land/views/widgets/custom_text_field.dart';
import 'package:home_land/views/widgets/custom_toast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class UserPropertySellPage extends StatefulWidget {
  UserPropertySellPage({Key? key, required this.userData}) : super(key: key);
  final LandServerModel userData;

  @override
  _UserPropertySellPageState createState() => _UserPropertySellPageState();
}

class _UserPropertySellPageState extends State<UserPropertySellPage> {
  List<File> images = [];
  TextEditingController desController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Property Sell"), actions: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ),
        ),
      ]),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                getMultipImage();
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromARGB(223, 228, 227, 227),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Icon(
                    Icons.add,
                    size: 50,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              height: 150,
              child: images.length == 0
                  ? Center(
                      child: Text("No Images found"),
                    )
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, i) {
                        return Container(
                            width: 100,
                            margin: EdgeInsets.only(right: 10),
                            height: 100,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(8)),
                            child: Image.file(
                              images[i],
                              fit: BoxFit.cover,
                            ));
                      },
                      itemCount: images.length,
                    ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text(
                    'Property Name: ',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue),
                  ),
                  Text(
                    widget.userData.Property_Name,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: scaffoldBackgroundColor),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text(
                    'Property Size: ',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue),
                  ),
                  Text(
                    widget.userData.Property_Size,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: scaffoldBackgroundColor),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text(
                    'Property Location: ',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue),
                  ),
                  Text(
                    widget.userData.Land_Location,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: scaffoldBackgroundColor),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text(
                    'Mouja No: ',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue),
                  ),
                  Text(
                    widget.userData.Mouja_No,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: scaffoldBackgroundColor),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text(
                    'Khotian No: ',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue),
                  ),
                  Text(
                    widget.userData.Khotian_No,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: scaffoldBackgroundColor),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text(
                    'Dag No: ',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue),
                  ),
                  Text(
                    widget.userData.Dag_No,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: scaffoldBackgroundColor),
                  ),
                ],
              ),
            ),
            CustomFormField(
              hintText: 'Property Description',
              controller: desController,
            ),
            CustomFormField(
              hintText: 'Property Price',
              controller: priceController,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: MaterialButton(
                color: Colors.blue,
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                height: 50,
                onPressed: () async {
                  showLoadingDialog(context);
                  for (int i = 0; i < images.length; i++) {
                    String url = await uploadFile(images[i]);
                    downloadUrls.add(url);

                    if (i == images.length - 1) {
                      storeEntry(downloadUrls);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ));
                    }
                  }
                },
                child: Text("Create Post"),
              ),
            )
          ]),
        ),
      ),
    );
  }

  List<String> downloadUrls = [];

  final ImagePicker _picker = ImagePicker();

  getMultipImage() async {
    final List<XFile>? pickedImages = await _picker.pickMultiImage();

    if (pickedImages != null) {
      pickedImages.forEach((e) {
        images.add(File(e.path));
      });

      setState(() {});
    }
  }

  Future<String> uploadFile(File file) async {
    final metaData = SettableMetadata(contentType: 'image/jpeg');
    final storageRef = FirebaseStorage.instance.ref();
    Reference ref = storageRef
        .child('pictures/${DateTime.now().microsecondsSinceEpoch}.jpg');
    final uploadTask = ref.putFile(file, metaData);

    final taskSnapshot = await uploadTask.whenComplete(() => null);
    String url = await taskSnapshot.ref.getDownloadURL();
    return url;
  }

  storeEntry(List<String> imageUrls) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    FirebaseFirestore.instance.collection('All_Property_Post').add({
      'Property_Name': widget.userData.Property_Name,
      'Dag_No': widget.userData.Dag_No,
      'Khotian_No': widget.userData.Khotian_No,
      'Mouja_No': widget.userData.Mouja_No,
      'Property_Description': desController.text,
      'Property_Location': widget.userData.Land_Location,
      'Property_Photo': imageUrls,
      'Property_Price': priceController.text,
      'Property_Size': widget.userData.Property_Size,
      'Seller_Name': widget.userData.Owner_Name,
      'Email': userProvider.userDataModel!.Email,
      'Nid_Number': userProvider.userDataModel!.Nid_Number,
      'Popularity': 0,
      'Seller_Photo': userProvider.userDataModel!.UserPhoto,
      'Phone_Number': userProvider.userDataModel!.Phone_Number,
      'Added_Date': DateTime.now(),
    }).then((value) {
      messageToast(context, 'Upload Successfully');
    });
  }
}
