import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_app/screens/auth_screen/signin_page.dart';
import 'package:food_app/screens/checkout_screen/card_screen.dart';
import 'package:food_app/screens/checkout_screen/checkout_screen.dart';
import 'package:food_app/screens/home_screen/product_detail_screen.dart';
import 'package:food_app/screens/main_screen/splash_screen.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: SplashScreen(),
      // home: CheckOutScreen(
      //   orderedItems: [],
      // ),
      // home: PaymentScreen(),
      home: SignUpPage(),
    );
  }
}
