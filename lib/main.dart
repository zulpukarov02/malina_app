// import 'package:flutter/animation.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(home: HomePage()));
// }

import 'package:flutter/material.dart';
import 'package:qr_code_scanner_app/corzina/food_page.dart';
import 'package:qr_code_scanner_app/home/bottom_navigation.dart';

import 'package:qr_code_scanner_app/home/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BottomNavigation(),
    );
  }
}
