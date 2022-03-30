// ignore: unused_import
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/How%20to%20use%20app/Datauseapp.dart';
import 'package:flutter_application_1/How%20to%20use%20app/Datauseapp2.dart';
import 'package:flutter_application_1/How%20to%20use%20app/Datauseapp3.dart';
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
      backgroundColor: Colors.deepPurple[400],
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: [
              SizedBox(
                height: 50,
              ),
              Column(children: [] //ส่วนของ นักศึกษา
                  ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        10,
                        10,
                        0,
                        0,
                      ),
                      child: Container(
                        height: 70,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          color: Colors.white,
                          shape: StadiumBorder(
                            side: BorderSide(
                                color: Colors.deepPurple[800], width: 3),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Datauseapp()));
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                size: 35,
                                color: Colors.deepPurple,
                              ),
                              Text(
                                'วิธีการใช้งานหน้าทำนายรุ่นรถยนต์',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Chakra'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        10,
                        10,
                        0,
                        0,
                      ),
                      child: Container(
                        height: 70,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          color: Colors.white,
                          shape: StadiumBorder(
                            side: BorderSide(
                                color: Colors.deepPurple[800], width: 3),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Datauseapp2()));
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.build_circle_outlined,
                                size: 35,
                                color: Colors.deepPurple,
                              ),
                              Text(
                                'วิธีการใช้งานหน้าการดูแลรักษารถยนต์\nสำหรับมือใหม่ 9 ข้อ',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Chakra'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        10,
                        10,
                        0,
                        0,
                      ),
                      child: Container(
                        height: 70,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          color: Colors.white,
                          shape: StadiumBorder(
                            side: BorderSide(
                                color: Colors.deepPurple[800], width: 3),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Datauseapp3()));
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.quiz_outlined,
                                size: 35,
                                color: Colors.deepPurple,
                              ),
                              Text(
                                'วิธีการใช้งานหน้าวิธีการใช้งานแอปพลิเคชั่น ',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Chakra'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
            ]),
      ),
    );
  }
}
