import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_app/screens/auth_screen/login_page.dart';
import 'package:food_app/screens/auth_screen/signin_page.dart';
import 'package:food_app/screens/checkout_screen/card_screen.dart';
import 'package:food_app/screens/checkout_screen/checkout_screen.dart';
import 'package:food_app/screens/home_screen/product_detail_screen.dart';
import 'package:food_app/screens/main_screen/app_screen.dart';
import 'package:food_app/screens/main_screen/splash_screen.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  User? user = FirebaseAuth.instance.currentUser;

  Widget screen;

  if (user != null) {
    screen = SplashScreen();
  } else {
    screen = LoginScreen();
  }

  runApp(MyApp(
    screen: screen,
  ));
}

class MyApp extends StatelessWidget {
  final Widget screen;
  const MyApp({super.key, required this.screen});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: screen,
    );
  }
}
