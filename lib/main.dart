import 'package:flutter/material.dart';
// ignore: unused_import

import 'package:flutter_application_1/intro_loading/SplashScreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'App Car';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        theme: new ThemeData(
        fontFamily: 'Kanit',
      ),
      );
}
