import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_1/How%20to%20use%20app/titleuseapp.dart';
import 'package:flutter_application_1/sizes_helpers.dart';

class Exampage3 extends StatefulWidget {
  Exampage3() : super();

  @override
  Exampage3State createState() => Exampage3State();
}

class Exampage3State extends State<Exampage3> {
  //
  CarouselSlider carouselSlider;

  // ignore: unused_field
  int _current = 0;
  List imgList = [
    'assets/EX/no5.jpg',
    'assets/EX/no6.jpg',
    'assets/EX/no7.jpg',
    'assets/EX/no8.jpg',
    'assets/EX/no11.jpg',
    'assets/EX/no12.jpg',
    'assets/EX/no13.jpg',
    'assets/EX/no14.jpg',
    'assets/EX/no15.jpg',
    //'assets/logowaitupdate.png','assets/logowaitupdate.png','assets/logowaitupdate.png',
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
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: displayHeight(context),
          width: displayWidth(context),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/intro.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            height: displayHeight(context),
            width: displayWidth(context),
            child: Center(
              child: SingleChildScrollView(
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
                          height: 50,
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
                                  "ตัวอย่างวิธีการใช้งานหน้าวิธีการใช้งาน",
                                  style: TextStyle(
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Chakra',
                                      fontSize: 18),
                                ),
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
                              onPressed: () => Navigator.pop(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Titleuseapp())),
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
                                  ? Colors.deepOrange
                                  : Colors.deepPurple[700],
                            ),
                          );
                        }),
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
