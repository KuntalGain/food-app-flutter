import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants/constants.dart';
import 'package:food_app/screens/main_screen/app_screen.dart';
import 'package:image_picker/image_picker.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  File? _image;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // controller
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cpasswordController = TextEditingController();

  // Fields
  String username = '';
  String email = '';
  String password = '';
  String confirmPassword = '';

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<void> _register() async {
    try {
      final UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // upload profile pic
      String profilePictureUrl = '';

      if (_image != null) {
        final storageRef = FirebaseStorage.instance
            .ref()
            .child('profile_picture')
            .child('${usernameController.text}.jpg');
        final uploadTask = storageRef.putFile(_image!);
        final snapshot = await uploadTask.whenComplete(() => {});
        profilePictureUrl = await snapshot.ref.getDownloadURL();
      }

      await _firestore.collection('user').doc(userCredential.user!.uid).set({
        'username': usernameController.text,
        'email': emailController.text,
        'profile_picture': profilePictureUrl,
        'password': passwordController.text,
        'cart-items': [],
      });

      // update user details

      await userCredential.user!.updateDisplayName(usernameController.text);
      await userCredential.user!.updatePhotoURL(profilePictureUrl);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'User Registration',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () => _pickImage(ImageSource.gallery),
              child: CircleAvatar(
                backgroundImage: (_image != null) ? FileImage(_image!) : null,
                backgroundColor: Colors.orange,
                radius: 50,
              ),
            ),
          ),
          SizedBox(height: 30),
          makeTiles(Icons.person, 'username', usernameController, false),
          makeTiles(Icons.email, 'email', emailController, false),
          makeTiles(Icons.password, 'password', passwordController, true),
          makeTiles(
              Icons.password, 'confirm password', cpasswordController, true),
          SizedBox(height: 30),
          Container(
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(25),
            ),
            child: MaterialButton(
              onPressed: _register,
              child: Text('Register'),
            ),
          ),
        ],
      ),
    );
  }
}
