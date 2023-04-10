import 'package:flutter/material.dart';
import 'package:food_app/models/Pizza_model.dart';
import 'package:food_app/models/burger_model.dart';
import 'package:food_app/models/drinks_model.dart';
import 'package:food_app/utils/categories.dart';
import 'package:food_app/screens/home_screen/home_screen_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../models/momo_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget currentScreen = HomePageWidget();
  int selectedIndex = 0;

  List<Widget> _screens = [
    HomePageWidget(),
    Container(child: Center(child: Text("My Cart"))),
    Container(child: Center(child: Text("WishList"))),
    Container(child: Center(child: Text("My Profile"))),
  ];

  void _onTabChanged(int index) {
    setState(() {
      selectedIndex = index;
      currentScreen = _screens[index];
    });
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
          "Home",
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
              icon: Icons.favorite_border,
              text: 'Wishlist',
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
