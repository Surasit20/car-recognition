import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Carf extends StatefulWidget {
  Carf() : super();

  @override
  CarfState createState() => CarfState();
}

class CarfState extends State<Carf> {
  //
  CarouselSlider carouselSlider;

  // ignore: unused_field
  int _current = 0;
  List imgList = [
    'assets/001.png',
    'assets/004.png',
    'assets/006.png',
  ];

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // ignore: deprecated_member_use

                Text(
                  "ตัวอย่างการเลือกมุมของรถยนต์ทางด้านหน้า",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Chakra'),
                ),
                SizedBox(
                  height: 50,
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