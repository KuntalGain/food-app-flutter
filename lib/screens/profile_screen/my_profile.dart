import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  Map<String, dynamic>? _userMap;
  String uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final userSnapshot = await FirebaseFirestore.instance
        .collection('user')
        .doc(currentUser!.uid)
        .get();

    setState(() {
      _userMap = userSnapshot.data();
    });
  }

  Future<void> updateData(String docId, String fieldName, dynamic value) async {
    try {
      await FirebaseFirestore.instance
          .collection('user')
          .doc(docId)
          .update({fieldName: value});
      print('Data Updated!');
    } catch (e) {
      print('Error caused by $e');
    }
  }

  Future<void> addFieldToDocument(
      String docId, String fieldName, dynamic value) async {
    try {
      await FirebaseFirestore.instance
          .collection('user')
          .doc(docId)
          .update({fieldName: value});
      print('Field added successfully!');
    } catch (e) {
      print('Error caused by $e');
    }
  }

  void showDialogBox(BuildContext context, String title) {
    showDialog(
        context: context,
        builder: (context) {
          final controller = TextEditingController();
          return AlertDialog(
            title: Text(title),
            content: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Enter Input here',
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  updateData(uid, 'username', controller.text);
                  setState(() {
                    fetchUserData();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('$title Updated Successfully!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  });
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        });
  }

  void addNewField(BuildContext context, String title) {
    showDialog(
        context: context,
        builder: (context) {
          final controller = TextEditingController();
          return AlertDialog(
            title: Text(title),
            content: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Enter Input here',
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  addFieldToDocument(uid, title, controller.text);
                  setState(() {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('$title Updated Successfully!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                    fetchUserData();
                  });
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    if (_userMap == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Container(
          child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              backgroundImage: NetworkImage(_userMap!['profile_picture']),
              radius: 50,
            ),
          ),
          MaterialButton(
            onPressed: () {},
            child: Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 3,
                        spreadRadius: 3,
                        offset: Offset(0, 3))
                  ]),
              child: Text('Change Image'),
            ),
          ),
          GestureDetector(
            onTap: () {
              showDialogBox(context, 'Name');
            },
            child: createList(Icons.person, 'Name', _userMap!['username']),
          ),
          GestureDetector(
            onTap: () {
              addNewField(context, 'Phone Number');
            },
            child: (_userMap!['Phone Number'] != null)
                ? createList(Icons.location_city, 'Phone Number',
                    _userMap!['Phone Number'])
                : createList(Icons.location_city, 'Phone Number', ''),
          ),
          GestureDetector(
            onTap: () {
              addNewField(context, 'City');
            },
            child: (_userMap!['City'] != null)
                ? createList(Icons.location_city, 'City', _userMap!['City'])
                : createList(Icons.location_city, 'City', ''),
          ),
          GestureDetector(
            onTap: () {
              addNewField(context, 'Location');
            },
            child: (_userMap!['Location'] != null)
                ? createList(
                    Icons.location_on, 'Location', _userMap!['Location'])
                : createList(Icons.location_on, 'Location', ''),
          ),
          GestureDetector(
            onTap: () {
              addNewField(context, 'Card');
            },
            child: (_userMap!['Card'] != null)
                ? createList(Icons.credit_card, 'Your Card', _userMap!['Card'])
                : createList(Icons.credit_card, 'Your Card', ''),
          )
        ],
      ));
    }
  }
}

Widget createList(IconData? iconData, String headline, String stringData) {
  return Container(
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    height: 60,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.grey.shade300,
      borderRadius: BorderRadius.circular(22),
    ),
    child: Row(
      children: [
        Icon(
          iconData,
          size: 35,
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              headline,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(stringData, style: TextStyle(fontSize: 20)),
          ],
        ),
      ],
    ),
  );
}
