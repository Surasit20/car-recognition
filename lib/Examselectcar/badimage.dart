import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_1/How%20to%20use%20app/guidetakeimage.dart';
import 'package:flutter_application_1/sizes_helpers.dart';

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
    'assets/Badimage/a1.jpg',
    'assets/Badimage/a2.jpg',
    'assets/Badimage/a3.jpg',
    'assets/Badimage/a4.jpg',
    'assets/Badimage/a5.jpg',
    'assets/Badimage/a6.jpg',
    'assets/Badimage/a7.jpg',
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
    return SafeArea(
      child: Scaffold(
       
        body: SingleChildScrollView (
          child:Container(
          height: displayHeight(context) * 1,
          width: displayWidth(context) * 1,
          decoration: BoxDecoration(
           
            image: DecorationImage(
              image: AssetImage("assets/intro.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //mainAxisAlignment: MainAxisAlignment.center,
    
                // ignore: deprecated_member_use
    
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 10),
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 80,
                   // width: displayWidth(context)*1,
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: [
                            Container(
                             
                              alignment: FractionalOffset.center,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: Text(
                                  "ตัวอย่างของภาพรถยนต์ที่ไม่เหมาะที่นำมาใช้ทำนายรุ่นรถยนต์",
                                  style: TextStyle(
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Chakra',
                                      fontSize: 19),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
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
                                        builder: (context) => Guidetakeimage())),
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(33,30,0,0),
                  child: Text(
                    "คือ ตัวอย่างของภาพรถยนต์ที่ไม่เห็นลักษณะรายละเอียดของรถยนต์ชัดเจน ไม่มีแสงสว่างเพียงพอ และยังมีวัตถุมาบดบังตัวรถยนต์",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Chakra'),
                  ),
                ),
    
                // ignore: deprecated_member_use
    
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      autoPlay: true,
                      onPageChanged: (index, reason) =>
                          setState(() => _current = index),
                    ),
                    items: imgList
                        .map((e) => ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Stack(
                                fit: StackFit.expand,
                                children: <Widget>[
                                  Image.asset(
                                    e,
                                    width: 1050,
                                    height: 350,
                                    fit: BoxFit.cover,
                                  )
                                ],
                              ),
                            ))
                        .toList(),
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
                        color:
                            _current == index ? Colors.red : Colors.deepPurple[900],
                      ),
                    );
                  }),
                ),
                /* Card(
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
                  ),*/
              ],
            ),
          ),
        ),
      )),
    );
  }
}
