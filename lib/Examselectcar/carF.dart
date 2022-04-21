import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_1/How%20to%20use%20app/guidetakeimage.dart';
import 'package:flutter_application_1/sizes_helpers.dart';
// ignore: unused_import
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
    'assets/CarF/11.jpg',
    'assets/CarF/12.jpg',
    'assets/CarF/13.jpg',
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
      ),
      backgroundColor: Colors.deepPurple[400],*/
      body: Container(
       height: displayHeight(context) * 1,
       // width: double.infinity,
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
                      height: 35,
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
                          Container(
                            alignment: FractionalOffset.center,
                            child: Text(
                              'ตัวอย่างของมุมรถยนต์ทางด้านหน้า',
                              style: TextStyle(
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Chakra',
                                  fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20,0, 0),
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
              padding: const EdgeInsets.fromLTRB(0,80,0,0),
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
                  margin: EdgeInsets.symmetric(vertical: 30.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index ? Colors.red : Colors.deepPurple[700],
                  ),
                );
              }),
            ),
            /*Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            140,
                            0,
                            0,
                            0,
                          ),
                          child: Container(
                             alignment: FractionalOffset.center,
                            child: Card(
                              //height: 70,
                              color:Colors.deepOrangeAccent,
                              // ignore: deprecated_member_use
                              child: Container(
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
                          ),
                        ),
                      ]), */ 
          ],
        ),
      ),
    );
    
  }
  
  
}
