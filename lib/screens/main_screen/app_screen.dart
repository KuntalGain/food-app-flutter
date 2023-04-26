import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/models/product_model.dart';
import 'package:food_app/screens/auth_screen/login_page.dart';
import 'package:food_app/screens/checkout_screen/card_screen.dart';
import 'package:food_app/screens/checkout_screen/cart_screen.dart';
import 'package:food_app/screens/checkout_screen/checkout_screen.dart';

import 'package:food_app/screens/home_screen/home_screen.dart';
import 'package:food_app/screens/profile_screen/my_profile.dart';
import 'package:food_app/screens/home_screen/product_detail_screen.dart';

import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String uid = FirebaseAuth.instance.currentUser!.uid;

  late List<Product> cartItems;
  bool isCheckout = false;
  // bool isDark = false;

  Widget currentScreen = HomePage(
    cartItems: [],
  );
  int selectedIndex = 0;

  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    cartItems = [];
    _screens = [
      HomePage(
        cartItems: cartItems,
      ),
      MyCartScreen(myCart: cartItems),
      MyProfileScreen()
    ];
  }

  List<String> _appBarTitle = ["Home", "My Cart", "Profile"];
  String _title = 'Home';

  void _onTabChanged(int index) {
    setState(() {
      selectedIndex = index;
      currentScreen = _screens[index];
      _title = _appBarTitle[index];

      if (_title == 'My Cart') {
        isCheckout = true;
      } else {
        isCheckout = false;
      }
    });
  }

  double totalPrice() {
    double total = 0.0;
    cartItems.forEach((product) {
      total += double.parse(product.price.toString()) *
          int.parse(product.quantity.toString());
    });

    return total;
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

  Future<void> cartListItems() async {
    try {
      final CollectionReference itemsRef =
          FirebaseFirestore.instance.collection('user');
      final DocumentReference docRef = itemsRef.doc(uid);

      await docRef.update({
        'cart-items': FieldValue.arrayUnion(
            cartItems.map((item) => item.toMap()).toList())
      });

      print('Cart items added successfully!');
    } catch (e) {
      print('Error adding cart items: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar
      resizeToAvoidBottomInset: false,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          },
          icon: Icon(
            Icons.exit_to_app,
            color: Colors.black,
          ),
        ),
        title: Text(
          _title,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),

      body: currentScreen,
      floatingActionButton: Visibility(
          visible: isCheckout,
          child: FloatingActionButton.extended(
            onPressed: () {
              setState(() {
                totalPrice();
              });

              cartListItems();

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PaymentScreen(
                            orderedProducts: cartItems,
                          )));
            },
            label: Text('Checkout'),
          )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: GNav(
          tabBackgroundColor: Colors.grey.shade200,
          onTabChange: _onTabChanged,
          gap: 8,
          tabs: [
            GButton(
              icon: Icons.home_outlined,
              text: 'Home',
            ),
            GButton(
              icon: Icons.shopping_cart_outlined,
              text: 'My Cart',
            ),
            GButton(
              icon: Icons.person_outline,
              text: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
