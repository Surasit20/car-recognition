import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_1/How%20to%20use%20app/guidetakeimage.dart';
import 'package:flutter_application_1/sizes_helpers.dart';

class Goodimage extends StatefulWidget {
  Goodimage() : super();

  @override
  GoodimageState createState() => GoodimageState();
}

class GoodimageState extends State<Goodimage> {
  //
  CarouselSlider carouselSlider;
  // ignore: unused_field
  int _current = 0;
  List imgList = [
    'assets/Goodimage/b1.jpg',
    'assets/Goodimage/b2.jpg',
    'assets/Goodimage/b3.jpg',
    'assets/Goodimage/b4.jpg',
    'assets/Goodimage/b5.jpg',
    'assets/Goodimage/b6.jpg',
    'assets/Goodimage/b7.jpg',
    'assets/Goodimage/b8.jpg',
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
       
        body: SingleChildScrollView(
        
        child: Container(
          height: displayHeight(context) * 1,
        
          width: displayWidth(context) * 1,
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                
                Padding(
                        padding: EdgeInsets.fromLTRB(0, 50, 0, 10),
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 3),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          height: 80,
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                               
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "ตัวอย่างของภาพรถยนต์ที่เหมาะที่นำมาใช้ทำนายรุ่นรถยนต์",
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
                      Container(
                        width: displayWidth(context)*1,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30,30,0,0),
                              child: Text(
                                "คือ ตัวอย่างของภาพรถยนต์ที่เห็นลักษณะรายละเอียดของรถยนต์ชัดเจน แสงสว่างเพียงพอ ไม่มีวัตถุมาบดบังตัวรถยนต์",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Chakra'),
                              ),
                            ),
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
               
                  
              ],
            ),
          ),
        ),
      )),
    );
  }
}