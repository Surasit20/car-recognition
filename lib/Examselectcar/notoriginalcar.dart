import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_1/How%20to%20use%20app/guidetakeimage.dart';

class Notoriginalcar extends StatefulWidget {
  Notoriginalcar() : super();

  @override
  NotoriginalcarState createState() => NotoriginalcarState();
}

class NotoriginalcarState extends State<Notoriginalcar> {
  //
  CarouselSlider carouselSlider;
  // ignore: unused_field
  int _current = 0;
  List imgList = [
    'assets/NoOrigincar/o1.png',
    'assets/NoOrigincar/o2.jpg',
    'assets/NoOrigincar/o3.jpg',
    'assets/NoOrigincar/o4.jpg',
    'assets/NoOrigincar/o5.jpg',
    'assets/NoOrigincar/o6.jpg',
  ];

  var buttonCarouselController;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: Colors.deepPurple[400],
      body: Container(
        height: double.infinity,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            
             Padding(
                    padding: EdgeInsets.fromLTRB(0, 50, 0, 60),
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 3),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 60,
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
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                alignment: FractionalOffset.center,
                                child: Text(
                                 "ตัวอย่างของรุ่นรถยนต์ที่ไม่เหมาะที่นำมาใช้\nทำนายรุ่นรถยนต์",
                                  style: TextStyle(
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Chakra',
                                      fontSize: 19),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                    child: Text(
                      "คือ ตัวอย่างของรุ่นรถยนต์ที่ทำการแปลงสภาพเดิมของรถยนต์ให้ต่างไปจากสภาพเดิมโรงงาน เช่น การดัดแปลงสภาพให้รถยนต์อยู่ในประเภทของ Offroad ซึ่งอาจจะทำให้ค่าการทำนายรุ่นรถยนต์ผิดพลาดไปยังรุ่นอื่นได้",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Chakra'),
                    ),
                  ),
         Padding(
              padding: const EdgeInsets.fromLTRB(0,70,0,0),
              child: CarouselSlider(
              options: CarouselOptions(
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                autoPlay: true,
                onPageChanged: (index, reason) => 
                  setState(() => _current = index),
              ),
              items: imgList.map((e) => ClipRRect(
               borderRadius: BorderRadius.circular(8),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Image.asset(e,
                    width: 1050,
                    height: 350,
                    fit: BoxFit.cover,)
                  ],
                ) ,
              )).toList(),
          ),
          
            ),
            SizedBox(
              height: 20,
            ),
           Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(imgList, (index, url) {
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index ? Colors.red : Colors.deepPurple[900],
                  ),
                );
              }),
            ),
            Card(
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
                              builder: (context) => Guidetakeimage()));
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
              ),
          ],
        ),
      ),
    );
  }
}
