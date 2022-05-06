import 'package:flutter/material.dart';
import 'package:flutter_application_1/Examselectcar/badimage.dart';
import 'package:flutter_application_1/Examselectcar/carB.dart';
import 'package:flutter_application_1/Examselectcar/carF.dart';
import 'package:flutter_application_1/Examselectcar/goodimage.dart';
// ignore: unused_import
import 'package:flutter_application_1/Examselectcar/notoriginalcar.dart';
// ignore: unused_import
import 'package:flutter_application_1/Examselectcar/test.dart';
// ignore: unused_import

// ignore: unused_import
import 'package:flutter_application_1/How%20to%20use%20app/titleuseapp.dart';
import 'package:flutter_application_1/sizes_helpers.dart';

class Guidetakeimage extends StatefulWidget {
  @override
  _GuidetakeimageState createState() => _GuidetakeimageState();
}

class _GuidetakeimageState extends State<Guidetakeimage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/intro.png"),
              fit: BoxFit.cover,
            ),
          ),
           height: displayHeight(context) ,
           width: displayWidth(context) ,
          child: Container(
            //alignment: Alignment.centerLeft,
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                                      onPressed: () =>  Navigator.pop(
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
              SizedBox(
                height: 20
              ),
              Card(
                child: Container(
                  //width: 370,
                  color: Colors.deepPurple,
                  alignment: Alignment.center,
                  height: 70,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Carf()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.directions_car_filled_outlined,
                              size: 25,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'ตัวอย่างการเลือกมุมรถยนต์ทางด้านหน้า',
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
                  //height: 70,

                  // ignore: deprecated_member_use
                  child: Container(
                    // width: 370,
                    color: Colors.deepPurple,
                    alignment: Alignment.center,
                    height: 70,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Carb()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.directions_car_filled_rounded,
                                size: 25,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                      'ตัวอย่างการเลือกมุมรถยนต์ทางด้านหลัง',
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
                                    
                                 
                        ]
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
                    //width: 370,
                    alignment: Alignment.center,
                    height: 70,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Goodimage()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.image_outlined,
                                size: 25,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                               Text(
                                      'ตัวอย่างภาพรถยนต์ที่เหมาะสม\nต่อการนำมาทำนาย',
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
                                    
                        ]
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
                                builder: (context) => Badimage()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.hide_image_outlined,
                                size: 25,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                               Text(
                                      'ตัวอย่างภาพรถยนต์ที่ไม่เหมาะ\nสมต่อการนำมาทำนาย',
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
                                builder: (context) => Notoriginalcar()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.bus_alert,
                                size: 25,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                               Text(
                                      'ตัวอย่างรถยนต์ที่ดัดแปลงสภาพ \nไม่เหมาะสมต่อการนำมาทำนาย',
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
              SizedBox(
                height: 100,
              ),
              /*Card(
                //height: 70,
                color: Colors.deepOrange,
                // ignore: deprecated_member_use
                child: Container(
                  width: 115,
                  // width: 370,
                  alignment: Alignment.center,
                  height: 40,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Titleuseapp()));
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.keyboard_return,
                          size: 25,
                          color: Colors.white,
                        ),
                        Container(
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'ย้อนกลับ',
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
              ),*/
             
            ]),
          ),
        ),
      ),
    );
  }
}
