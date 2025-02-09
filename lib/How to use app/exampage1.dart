import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_1/How%20to%20use%20app/titleuseapp.dart';
import 'package:flutter_application_1/sizes_helpers.dart';

import '../Home/Newselectcar.dart';
import '../Khowledge_car/khowledge_page.dart';

class Exampage1 extends StatefulWidget {
  Exampage1() : super();

  @override
  Exampage1State createState() => Exampage1State();
}

class Exampage1State extends State<Exampage1> {
  //
  CarouselSlider carouselSlider;

  // ignore: unused_field
  int _current = 0;
  List imgList = [
    'assets/EX/no1.jpg',
    'assets/EX/no2.jpg',
    'assets/EX/no3.jpg',
    'assets/EX/no4.jpg',
    //'assets/EX/ex5.jpg',
    /* 'assets/logowaitupdate.png',
    'assets/logowaitupdate.png',
    'assets/logowaitupdate.png',*/
  ];
  /*int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }*/
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

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      /*appBar: AppBar(
          title: Text(
            'ข้อมูลวิธีการใช้งาน',
            style: TextStyle(fontFamily: 'Chakra'),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple[400], Colors.deepPurple[200]],
                stops: [0.2, 1.0],
              ),
            ),
          ),
        ),*/
      //backgroundColor: Colors.deepPurple[400],
      body: Container(
          height: displayHeight(context),
          width: displayWidth(context),
          decoration: BoxDecoration(
            /*gradient: LinearGradient(
              colors: [Colors.deepPurple[400], Colors.deepPurple[200]],
              stops: [0.2, 1.0],
            ),*/
            image: DecorationImage(
              image: AssetImage("assets/intro.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
              height: displayHeight(context),
              width: displayWidth(context),
              child: SingleChildScrollView(
                  child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 50, 0, 10),
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: 3),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 15),
                              blurRadius: 50,
                              color: Colors.deepPurple,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              alignment: FractionalOffset.center,
                              child: Text(
                                'การทำนายเพื่อระบุรุ่นรถยนต์',
                                style: TextStyle(
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Chakra',
                                    fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      child: SizedBox(
                        //กดเพื่อ clear รูปภาพ ข้อมูล
                        width: 50,
                        child: Container(
                          height: 40,
                          width: 40,
                          child: FloatingActionButton(
                            //icon กดเคลียร์รูปภาพ
                            //heroTag: 'ClearState',
                            heroTag: null,
                            onPressed: () => Navigator.pop(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Titleuseapp())),
                            backgroundColor: Colors.red,
                            child: Icon(
                              //Icons.clean_hands_outlined,
                              Icons.keyboard_return,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: 550,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: false,
                          //autoPlay: true,
                          onPageChanged: (index, reason) =>
                              setState(() => _current = index),
                        ),
                        items: imgList
                            .map((e) => Container(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Container(
                                      child: Stack(
                                        fit: StackFit.expand,
                                        children: <Widget>[
                                          Image.asset(
                                            e,
                                            width: 1050,
                                            height: 1050,
                                            fit: BoxFit.contain,
                                            filterQuality: FilterQuality.low,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                    SizedBox(
                      height: 0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: map<Widget>(imgList, (index, url) {
                        return Container(
                          width: 10.0,
                          height: 10.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == index
                                ? Colors.deepOrange
                                : Colors.deepPurple[700],
                          ),
                        );
                      }),
                    ),
                  ]))))),

      /* bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),*/
      /*bottomNavigationBar: CurvedNavigationBar(
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
            )
            : screens[indexpage]*/
    ));
  }
}
