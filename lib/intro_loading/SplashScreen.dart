// ignore_for_file: unnecessary_import

import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Bottombar/home_page.dart';
import 'package:flutter_application_1/sizes_helpers.dart';




class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Home())));    //เมื่อครบเวลา 5 วิ จะทำหน้าเปลี่ยนที่ไปหน้า OnBoardingPage 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: displayWidth(context),
        height:displayHeight(context),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [
                0.1,
                0.5,
                0.8,
                1.0
              ],
              colors: [
                Color(0xFFF5F5F5), // backgroud   //เฉดสีพื้นหลัง
                Colors.white,
                Colors.white,
                Colors.white,
              ]),
        ),
        child: Column(
         // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Center(
                  child: Image.asset(     //รูป logo
                    "assets/logo app.png",
                    height: 150.0,
                    width: 150.0,
                  ),
                ),
                
              ],
            ),
            /*CircularProgressIndicator(
              // วงกลม loading
            valueColor: AlwaysStoppedAnimation<Color>(Colors.purpleAccent),
            ),*/
            Center(
                  child: Image.asset(     //รูป logo
                  // "assets/animated-car-image-0112.gif",
                  "assets/gif-3.gif",
                    height: 200.0,
                    width: 200.0,
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
