import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  File? _image;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: CircleAvatar(
            backgroundImage: (_image != null) ? FileImage(_image!) : null,
            radius: 50,
          ),
        ),
        MaterialButton(
          onPressed: () => _pickImage(ImageSource.gallery),
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
        createList(Icons.person, 'Name', 'John Doe'),
        createList(Icons.phone, 'Phone', '+91xxxxxxxxxx'),
        createList(Icons.location_city, 'City', 'London'),
        createList(Icons.location_on, 'Location', 'Joseph\'s Street'),
        createList(Icons.credit_card, 'Your Card', '6126-2794-3525-5282')
      ],
    ));
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
