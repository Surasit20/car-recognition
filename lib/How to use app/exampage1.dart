import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_1/How%20to%20use%20app/titleuseapp.dart';

class Exampage1 extends StatefulWidget {
  Exampage1() : super();

  @override
  Exampage1State createState() => Exampage1State();
}

class Exampage1State extends State<Exampage1> {
  //
  CarouselSlider carouselSlider;

  // ignore: unused_field
  int _current = 0;
  List imgList = [
    'assets/EX/ex1.jpg',
    'assets/EX/ex2.jpg',
    'assets/EX/ex3.jpg',
    'assets/EX/ex4.jpg',
    'assets/EX/ex5.jpg',
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
      ),*/
      //backgroundColor: Colors.deepPurple[400],
      body: Container(
        height: double.infinity,
        width: double.infinity,
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
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                              'การทำนายเพื่อระบุรุ่นรถยนต์',
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
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 550,
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
                        margin: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _current == index
                              ? Colors.white
                              : Colors.deepPurple[700],
                        ),
                      );
                    }),
                  ),
                  Container(
                    width: 115,
                    alignment: FractionalOffset.center,
                    child: Card(
                      //height: 70,
                      color: Colors.deepOrangeAccent,
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
                                    builder: (context) => Titleuseapp()));
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
                ]),
          ),
        ),
      ),
    );
  }
}
