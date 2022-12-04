import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home/Newselectcar.dart';

// ignore: unused_import

// ignore: unused_import

import 'package:flutter_application_1/How%20to%20use%20app/titleuseapp.dart';
import 'package:flutter_application_1/Khowledge_car/khowledge_page.dart';
import 'package:flutter_application_1/sizes_helpers.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> screens = [
    //ฟังค์ชั่น ปุ่ม bottom bar
    Newpageselectcar(),
    Dashboard(),
    Titleuseapp(),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Newpageselectcar(); // Our first view in viewport
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  int indexpage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: displayHeight(context) * 1,
      width: displayWidth(context) * 1,
      child: Scaffold(
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.deepPurple[400],
            key: _bottomNavigationKey,
            height: 55.0,
            items: <Widget>[
              Image.asset(
                'assets/carsearch.png',
                width: 44,
                height: 44,
                fit: BoxFit.cover,
              ),
              Image.asset(
                'assets/carcare.png',
                width: 44,
                height: 44,
                fit: BoxFit.cover,
              ),
              Image.asset(
                'assets/carexam.png',
                width: 44,
                height: 44,
                fit: BoxFit.cover,
              ),
              /*Icon(
                Icons.search,
                size: 35,
                color: Colors.deepPurple,
              ),*/
              /*Icon(
                Icons.build_circle_outlined,
                size: 35,
                color: Colors.deepPurple,
              ),*/
              /*Icon(
                Icons.quiz_outlined,
                size: 35,
                color: Colors.deepPurple,
              ),*/
            ],
            color: Colors.white,
            buttonBackgroundColor: Colors.white,
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 600),
            onTap: (index) {
              setState(() {
                indexpage = index;
              });
            },
          ),
          body: screens[indexpage]),
    );
  }
}
