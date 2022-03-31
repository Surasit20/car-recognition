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
                      
                      child: Image.asset(
                      
                        imgUrl,
                        fit: BoxFit.cover,
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
