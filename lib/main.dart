import 'package:flutter/material.dart';
import 'package:food_app/screens/checkout_screen/card_screen.dart';
import 'package:food_app/screens/checkout_screen/checkout_screen.dart';
import 'package:food_app/screens/home_screen/product_detail_screen.dart';
import 'package:food_app/screens/main_screen/splash_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      // home: CheckOutScreen(
      //   orderedItems: [],
      // ),
      // home: PaymentScreen(),
    );
  }
}
