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
// ignore: unused_import

class Titleuseapp extends StatefulWidget {
  @override
  _TitleuseappState createState() => _TitleuseappState();
}

class _TitleuseappState extends State<Titleuseapp> {
  //int currentTab = 0; // to keep track of active tab index
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      //backgroundColor: Colors.deepPurple[400],
      body: Container(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/intro.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
          
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start,
                 children: [
              SizedBox(
                height: 50,
              ),
              Column(children: <Widget>[
                Container(
                  child: Card(
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
                          children: [
                            Icon(
                              Icons.search,
                              size: 25,
                              color: Colors.white,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'วิธีการใช้งานหน้าทำนายรุ่นรถยนต์',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Chakra'),
                                      ),
                                      SizedBox(
                                        width: 80,
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
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
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
                        children: [
                          Icon(
                            Icons.build_circle_outlined,
                            size: 25,
                            color: Colors.white,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'วิธีการใช้งานหน้าการดูแลรักษารถยนต์\nสำหรับมือใหม่ 9 ข้อ',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Chakra'),
                                    ),
                                    SizedBox(
                                      width: 50,
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
              Card(
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
                      children: [
                        Icon(
                          Icons.quiz_outlined,
                          size: 25,
                          color: Colors.white,
                        ),
                        Container(
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'วิธีการใช้งานหน้าวิธีการใช้งาน\nแอปพลิเคชั่น ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Chakra'),
                                  ),
                                  SizedBox(
                                    width: 108,
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
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
                      children: [
                        Icon(
                          Icons.image_search,
                          size: 25,
                          color: Colors.white,
                        ),
                        Container(
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'ตัวอย่างการเลือกรูปมาทำนายให้\nเหมาะสม ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Chakra'),
                                  ),
                                  SizedBox(
                                    width: 90,
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
