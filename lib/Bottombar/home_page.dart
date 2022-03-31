import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home/selectcar.dart';
// ignore: unused_import
import 'package:flutter_application_1/How%20to%20use%20app/Homeuseapp.dart';
// ignore: unused_import
import 'package:flutter_application_1/How%20to%20use%20app/setting_page.dart';
import 'package:flutter_application_1/How%20to%20use%20app/titleuseapp.dart';
import 'package:flutter_application_1/Khowledge_car/khowledge_page.dart';
// ignore: unused_import

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    selectcar(),
    Dashboard(),
    Titleuseapp(),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = selectcar(); // Our first view in viewport
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  int indexpage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
           backgroundColor: Colors.deepPurple[400],
          key: _bottomNavigationKey,
          height: 50.0,
          
          items: <Widget>[
            Icon(
              Icons.search,
              size: 35,
              color: Colors.deepPurple,
            ),
            Icon(
              Icons.build_circle_outlined,
              size: 35,
              color: Colors.deepPurple,
            ),
            Icon(
              Icons.quiz_outlined,
              size: 35,
              color: Colors.deepPurple,
            ),
          ],
          color: Colors.white,
          // backgroundColor: Colors.blueAccent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              indexpage = index;
            });
          },
        ),
        body: screens[indexpage]);
  }
}
