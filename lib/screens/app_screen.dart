import 'package:flutter/material.dart';
import 'package:food_app/models/product_model.dart';
import 'package:food_app/screens/cart_screen.dart';

import 'package:food_app/screens/home_screen.dart';
import 'package:food_app/screens/product_detail_screen.dart';

import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Product> cartItems;
  bool isCheckout = false;

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
      // Container(child: Center(child: Text("My Cart"))),
      // Container(child: Center(child: Text("WishList"))),
      Container(child: Center(child: Text("My Profile"))),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar

      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        elevation: 0,
        title: Text(
          _title,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://th.bing.com/th/id/R.7b528d6309ee84dc0d8fbffef7cc9347?rik=Ac41QfcbFb0X6w&riu=http%3a%2f%2fcitizenmed.files.wordpress.com%2f2011%2f08%2fuser-icon1.jpg&ehk=kGtwMi0FM8rFOdcmsL3MLXNa%2bvJRFD1UsrI%2bunvLu%2fI%3d&risl=&pid=ImgRaw&r=0'),
          )
        ],
      ),

      body: currentScreen,
      floatingActionButton: Visibility(
          visible: isCheckout,
          child: FloatingActionButton.extended(
            onPressed: () {},
            label: Text('Checkout : \$${totalPrice()}'),
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
