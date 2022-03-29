import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home/selectcar.dart';
import 'package:flutter_application_1/How%20to%20use%20app/setting_page.dart';
import 'package:flutter_application_1/Khowledge_car/khowledge_page.dart';
// ignore: unused_import
import 'package:flutter_application_1/Recommend how to use/Onbording_page.dart';
// ignore: unused_import
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    Dashboard(),
    Settings(),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = selectcar(); // Our first view in viewport

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple,
        body: PageStorage(
          child: currentScreen,
          bucket: bucket,
        ),
        
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MaterialButton(
                        minWidth: 190,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => Dashboard()),
                          );
                          setState(() {
                            currentScreen =
                                selectcar(); // if user taps on this dashboard tab will be active
                            //currentTab = 0;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.car_repair,
                              /*color: currentTab == 0
                                  ? Colors.deepPurple
                                  : Colors.grey,*/
                                  color: Colors.deepPurple[900],
                            ),
                            Text(
                              'การดูแลรักษารถยนต์',
                              style: TextStyle(
                                /*color: currentTab == 0
                                    ? Colors.deepPurple
                                    : Colors.grey,*/
                                    color: Colors.deepPurple[900],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Right Tab bar icons
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            MaterialButton(
                              minWidth: 190,
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (_) => Settings()),
                                );
                                setState(() {
                                  currentScreen =
                                      selectcar(); // if user taps on this dashboard tab will be active
                                  //currentTab = 5;
                                });
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.announcement_outlined,
                                    
                                        color: Colors.deepPurple[900],
                                  ),
                                  Text(
                                    'ข้อมูลวิธีการใช้งาน',
                                    style: TextStyle(
                                  
                                          color: Colors.deepPurple[900],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]
                        ),
                    ]
                  )
              ],
            ),
          ),
        )
      );
  }
}

