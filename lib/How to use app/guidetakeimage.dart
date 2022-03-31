import 'package:flutter/material.dart';
import 'package:flutter_application_1/Examselectcar/badimage.dart';
import 'package:flutter_application_1/Examselectcar/carB.dart';
import 'package:flutter_application_1/Examselectcar/carF.dart';
import 'package:flutter_application_1/Examselectcar/goodimage.dart';
import 'package:flutter_application_1/Examselectcar/notoriginalcar.dart';
// ignore: unused_import
import 'package:flutter_application_1/Examselectcar/test.dart';
// ignore: unused_import
import 'package:flutter_application_1/How%20to%20use%20app/Datauseapp.dart';

// ignore: unused_import
import 'package:flutter_application_1/How%20to%20use%20app/titleuseapp.dart';


class Guidetakeimage extends StatefulWidget {
  @override
  _GuidetakeimageState createState() => _GuidetakeimageState();
}

class _GuidetakeimageState extends State<Guidetakeimage> {
  
  @override
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
                                    builder: (context) => Carf()));
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.directions_car_filled_outlined,
                                size: 35,
                                color: Colors.deepPurple,
                              ),
                              Text(
                                'ตัวอย่างการเลือกมุมของรถยนต์ทาง\nด้านหน้า',
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
                                    builder: (context) => Carb()));
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.directions_car_rounded,
                                size: 35,
                                color: Colors.deepPurple,
                              ),
                              Text(
                                'ตัวอย่างการเลือกมุมของรถยนต์ทาง\nด้านหลัง',
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
                          onPressed: () async {
                            await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Goodimage()));
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.image_outlined,
                                size: 35,
                                color: Colors.deepPurple,
                              ),
                              Text(
                                'ตัวอย่างของภาพรถยนต์ที่เหมาะที่นำมาใช้\nทำนายรุ่นรถยนต์ ',
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
                                side:
                                    BorderSide(color: Colors.deepPurple[800], width: 3),
                              ),
                              onPressed: ()  async {
                               await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Badimage()));
                              },
                              child: Row(
                                children: [
                                  Icon(
                                Icons.image_not_supported_outlined,
                                size: 35,
                                color: Colors.deepPurple,
                              ),
                              Text(
                                'ตัวอย่างของภาพรถยนต์ที่ไม่เหมาะที่นำมาใช้\nทำนายรุ่นรถยนต์ ',
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
                                side:
                                    BorderSide(color: Colors.deepPurple[800], width: 3),
                              ),
                              onPressed: ()  async {
                               await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Notoriginalcar()));
                              },
                              child: Row(
                                children: [
                                  Icon(
                                Icons.bus_alert_outlined,
                                size: 35,
                                color: Colors.deepPurple,
                              ),
                              Text(
                                'ตัวอย่างของรุ่นรถยนต์ที่ไม่เหมาะที่นำมาใช้\nทำนายรุ่นรถยนต์ ',
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
