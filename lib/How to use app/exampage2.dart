import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Exampage2 extends StatefulWidget {
  Exampage2() : super();

  @override
  Exampage2State createState() => Exampage2State();
}

class Exampage2State extends State<Exampage2> {
  //
  CarouselSlider carouselSlider;

  // ignore: unused_field
  int _current = 0;
  List imgList = [
    'assets/ex6.jpg',
    'assets/ex7.jpg',
    'assets/ex8.jpg',
   
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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple[400], Colors.deepPurple[200]],
            stops: [0.2, 1.0],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // ignore: deprecated_member_use

                  Text(
                    "ตัวอย่างวิธีการใช้งานหน้าการดูแลรักษารถยนต์\nสำหรับมือใหม่ 9 ข้อ",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Chakra'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // ignore: deprecated_member_use
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 530,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  //autoPlay: true,
                  onPageChanged: (index, reason) =>
                      setState(() => _current = index),
                ),
                items: imgList
                    .map((e) => Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              
                              child: Stack(
                                fit: StackFit.expand,
                                children: <Widget>[
                                  Image.asset(
                                    e,
                                    width: 1050,
                                    height: 1050,
                                    fit: BoxFit.contain,
                                    filterQuality: FilterQuality.low,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
            SizedBox(
              height: 0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(imgList, (index, url) {
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 30.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index
                        ? Colors.white
                        : Colors.deepPurple[700],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
