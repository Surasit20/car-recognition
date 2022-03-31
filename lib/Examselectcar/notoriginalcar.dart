import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
    'assets/o1.png',
    'assets/o2.jpg',
    'assets/o3.jpg',
    'assets/o4.jpg',
    'assets/o5.jpg',
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // ignore: deprecated_member_use

                  Text(
                    "ตัวอย่างของรุ่นรถยนต์ที่ไม่เหมาะที่นำมาใช้\nทำนายรุ่นรถยนต์",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Chakra'),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                    child: Text(
                      "คือ ตัวอย่างของรุ่นรถยนต์ที่ทำการแปลงสภาพเดิมของรถยนต์ให้ต่างไปจากสภาพเดิมโรงงาน เช่น การดัดแปลง\nสภาพให้รถยนต์อยู่ในประเภทของ Offroad",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Chakra'),
                    ),
                  ),
                  
                  // ignore: deprecated_member_use
                ],
              ),
            ),
         Padding(
          padding: const EdgeInsets.fromLTRB(0,40,0,0),
           child: CarouselSlider(
              options: CarouselOptions(
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                autoPlay: true,
                
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
          
            
          ],
        ),
      ),
    );
  }
}
