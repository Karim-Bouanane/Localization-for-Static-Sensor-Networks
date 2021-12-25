import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_signup/home_screen.dart';
import 'package:login_signup/login_screen.dart';
import 'package:login_signup/map_screen.dart';
import 'package:login_signup/menu_screen.dart';
import 'package:login_signup/location_screen.dart';
import 'package:login_signup/qrscan_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'login_screen',
      routes: {
        'login_screen': (context) => LoginScreen(),
        'home_screen': (context) => HomeScreen(),
        'location_screen': (context) => LocationScreen(),
        'qrscan_screen': (context) => QRScanScreen(),
        'menu_screen': (context) => MenuScreen(),
        'map_screen': (context) => MapScreen()
      },
    );
  }
}
