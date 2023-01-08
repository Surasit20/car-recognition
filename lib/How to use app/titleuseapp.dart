// ignore: unused_import
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/How%20to%20use%20app/exampage1.dart';
import 'package:flutter_application_1/How%20to%20use%20app/exampage2.dart';
import 'package:flutter_application_1/How%20to%20use%20app/exampage3.dart';

// ignore: unused_import
import 'package:flutter_application_1/How%20to%20use%20app/guidetakeimage.dart';

// ignore: unused_import
import 'package:flutter_application_1/Khowledge_car/khowledge_page.dart';
import 'package:flutter_application_1/sizes_helpers.dart';
// ignore: unused_import

class Titleuseapp extends StatefulWidget {
  @override
  _TitleuseappState createState() => _TitleuseappState();
}

class _TitleuseappState extends State<Titleuseapp> {
  //int currentTab = 0; // to keep track of active tab index
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'ข้อมูลวิธีการใช้งาน',
            style: TextStyle(fontFamily: 'Chakra'),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
               colors: [Color.fromARGB(255, 158, 129, 245), Colors.deepPurple[400]],  
                stops: [0.2, 1.0],
              ),
            ),
          ),
        ),
        //backgroundColor: Colors.deepPurple[400],
        body: Container(
          height: displayHeight(context) + MediaQuery.of(context).padding.top,
                  //-kToolbarHeight,
                  width: displayWidth(context) * 1,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/intro.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Container(
                 
                  child:
                      Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                    SizedBox(
                      height: 50,
                    ),
                    Column(children: <Widget>[
                      
                       Card(
                          //height: 70,
    
                          // ignore: deprecated_member_use
                          child: Container(
                            // width: 370,
                            color: Colors.deepPurple,
                            alignment: Alignment.center,
                            height: 70,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Exampage1()));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.search,
                                        size: 25,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'วิธีการใช้งานการทำนายรุ่นรถยนต์',
                                        style: TextStyle(
                                            fontSize: displayWidth(context)*0.04,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Chakra'),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '>',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Chakra'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      
                      Padding(
                       padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Card(
                          child: Container(
                            // width: 370,
                            color: Colors.deepPurple,
                            alignment: Alignment.center,
                            height: 70,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Exampage2()));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.build_circle_outlined,
                                        size: 25,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'วิธีการใช้งานหน้าการดูแลรักษารถยนต์\nสำหรับมือใหม่ 9 ข้อ',
                                        style: TextStyle(
                                            fontSize: displayWidth(context)*0.04,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Chakra'),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '>',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Chakra'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                    Padding(
                     padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Card(
                        child: Container(
                          //width: 370,
                          color: Colors.deepPurple,
                          alignment: Alignment.center,
                          height: 70,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => Exampage3()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.quiz_outlined,
                                      size: 25,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'วิธีการใช้งานหน้าวิธีการใช้งาน\nแอปพลิเคชั่น ',
                                      style: TextStyle(
                                          fontSize: displayWidth(context)*0.04,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Chakra'),
                                    ),
                                  ],
                                ),
                                Text(
                                  '>',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Chakra'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Card(
                        //height: 70,
                        color: Colors.deepPurple,
                        // ignore: deprecated_member_use
                        child: Container(
                          // width: 370,
                          alignment: Alignment.center,
                          height: 70,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Guidetakeimage()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.image_search,
                                      size: 25,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'ตัวอย่างการเลือกรูปมาทำนายให้\nเหมาะสม ',
                                      style: TextStyle(
                                          fontSize: displayWidth(context)*0.04,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Chakra'),
                                    ),
                                  ],
                                ),
                                Text(
                                  '>',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Chakra'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ),
        ),
    );
    
  }
}
