import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class Badimage extends StatefulWidget {
  Badimage() : super();

  @override
  BadimageState createState() => BadimageState();
}

class BadimageState extends State<Badimage> {
  //
  CarouselSlider carouselSlider;
  // ignore: unused_field
  int _current = 0;
  List imgList = [
    'assets/a1.jpg',
    'assets/a2.jpg',
    'assets/a3.jpg',
    'assets/a4.jpg',
    'assets/a5.jpg',
    'assets/a6.jpg',
    
  ];

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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // ignore: deprecated_member_use

                Text(
                  "ตัวอย่างของภาพรถยนต์ที่ไม่เหมาะที่นำมาใช้\nทำนายรุ่นรถยนต์",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Chakra'),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(20,10,0,0),
                  child: Text(
                    "คือ ตัวอย่างของภาพรถยนต์ที่ไม่เห็นลักษณะรายละเอียดของรถยนต์ชัดเจน ไม่มีแสงสว่างเพียงพอ และยังมีวัตถุมาบดบังตัวรถยนต์",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Chakra'),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                // ignore: deprecated_member_use
              ],
            ),
           CarouselSlider(
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
            SizedBox(
              height: 20,
            ),
          
            
          ],
        ),
      ),
    );
  }
}