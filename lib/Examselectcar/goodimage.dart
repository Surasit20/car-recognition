import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Goodimage extends StatefulWidget {
  Goodimage() : super();

  @override
  GoodimageState createState() => GoodimageState();
}

class GoodimageState extends State<Goodimage> {
  //
  CarouselSlider carouselSlider;
  int _current = 0;
  List imgList = [
    'assets/b1.jpg',
    'assets/b2.jpg',
    'assets/b3.jpg',
    'assets/b4.jpg',
    'assets/b5.jpg',
    'assets/b6.jpg',
    'assets/b7.jpg',
    'assets/b8.jpg',
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
                  "ตัวอย่างของภาพรถยนต์ที่เหมาะที่นำมาใช้\nทำนายรุ่นรถยนต์",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Chakra'),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(20,10,0,0),
                  child: Text(
                    "คือ ตัวอย่างของภาพรถยนต์ที่เห็นลักษณะรายละเอียดของรถยนต์ชัดเจน แสงสว่างเพียงพอ ไม่มีวัตถุมาบดบังตัวรถยนต์",
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
            carouselSlider = CarouselSlider(
              height: 350.0,
              initialPage: 0,
              enlargeCenterPage: true,
              autoPlay: true,
              reverse: false,
              enableInfiniteScroll: true,
              autoPlayInterval: Duration(seconds: 10),
              autoPlayAnimationDuration: Duration(milliseconds: 2000),
              pauseAutoPlayOnTouch: Duration(seconds: 10),
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {
                setState(() {
                  _current = index;
                });
              },
             items: imgList.map((imgUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child:  Image.asset(
                        imgUrl,
                        fit: BoxFit.fitWidth,
                      ),
                    );
                  },
                );
              }).toList(),
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
                    color: _current == index
                        ? Colors.white
                        : Colors.deepPurple[800],
                  ),
                );
              }),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // ignore: deprecated_member_use
                OutlineButton(
                  onPressed: goToPrevious,
                  child: Text(
                    "ก่อนหน้า",
                    style: TextStyle(color: Colors.white),
                  ),
                  highlightedBorderColor: Colors.deepPurple,
                  borderSide: BorderSide(
                    width: 3.0,
                    color: Colors.white,
                    style: BorderStyle.solid,
                  ),
                ),
                // ignore: deprecated_member_use
                OutlineButton(
                  onPressed: goToNext,
                  child: Text(
                    "ถัดไป",
                    style: TextStyle(color: Colors.white),
                  ),
                  highlightedBorderColor: Colors.deepPurple,
                  borderSide: BorderSide(
                    width: 3.0,
                    color: Colors.white,
                    style: BorderStyle.solid,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  goToPrevious() {
    carouselSlider.previousPage(
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  goToNext() {
    carouselSlider.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.decelerate);
  }
}
