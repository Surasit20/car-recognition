import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_1/How%20to%20use%20app/titleuseapp.dart';
import 'package:flutter_application_1/sizes_helpers.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Home/Newselectcar.dart';
import '../Khowledge_car/khowledge_page.dart';

class Creditpage extends StatefulWidget {
  Creditpage() : super();

  @override
  CreditpageState createState() => CreditpageState();
}

class CreditpageState extends State<Creditpage> {
  //

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                height: displayHeight(context),
                width: displayWidth(context),
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
                child: Container(
                    height: displayHeight(context),
                    width: displayWidth(context),
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
                                      'เครดิตข้อมูลที่นำมาแสดงบนแอปพลิเคชัน',
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
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              height: displayHeight(context),
                              child: GridView.count(
                                primary: false,
                                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 15,
                                crossAxisCount: 3,
                                children: <Widget>[
                                  Container(
                                      child: ConstrainedBox(
                                          constraints: BoxConstraints.expand(),
                                          child: ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors
                                                            .deepPurpleAccent),
                                              ),
                                              onPressed: () async {
                                                String url =
                                                    "https://www.toyota.co.th/model-list";
                                                var urllaunchable = await canLaunch(
                                                    url); //canLaunch is from url_launcher package
                                                if (urllaunchable) {
                                                  await launch(
                                                      url); //launch is from url_launcher package to launch URL
                                                } else {
                                                  print(
                                                      "URL can't be launched.");
                                                }
                                              },
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10),
                                                    child: Image.asset(
                                                        'assets/credit/toyota.png'),
                                                  ),
                                                  Text(
                                                    'TOYOTA',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18),
                                                  ),
                                                ],
                                              )))),
                                  Container(
                                      child: ConstrainedBox(
                                          constraints: BoxConstraints.expand(),
                                          child: ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.deepPurple.shade900),
                                                        
                                              ),
                                              onPressed: () async {
                                                String url =
                                                    "https://www.honda.co.th/models";
                                                var urllaunchable = await canLaunch(
                                                    url); //canLaunch is from url_launcher package
                                                if (urllaunchable) {
                                                  await launch(
                                                      url); //launch is from url_launcher package to launch URL
                                                } else {
                                                  print(
                                                      "URL can't be launched.");
                                                }
                                              },
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10),
                                                    child: Image.asset(
                                                        'assets/credit/honda.png'),
                                                  ),
                                                  Text(
                                                    'HONDA',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18),
                                                  ),
                                                ],
                                              )))),
                                  Container(
                                      child: ConstrainedBox(
                                          constraints: BoxConstraints.expand(),
                                          child: ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                          Colors.deepPurpleAccent),
                                              ),
                                              onPressed: () async {
                                                String url =
                                                    "https://www.isuzu-tis.com";
                                                var urllaunchable = await canLaunch(
                                                    url); //canLaunch is from url_launcher package
                                                if (urllaunchable) {
                                                  await launch(
                                                      url); //launch is from url_launcher package to launch URL
                                                } else {
                                                  print(
                                                      "URL can't be launched.");
                                                }
                                              },
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10),
                                                    child: Image.asset(
                                                        'assets/credit/isuzu.png'),
                                                  ),
                                                  Text(
                                                    'ISUZU',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                       fontSize: 18),
                                                  ),
                                                ],
                                              )))),
                                Container(
                                      child: ConstrainedBox(
                                          constraints: BoxConstraints.expand(),
                                          child: ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.deepPurple.shade900
                                                            ),
                                              ),
                                              onPressed: () async {
                                                String url =
                                                    "https://www.nissan.co.th/vehicles/all-models.html";
                                                var urllaunchable = await canLaunch(
                                                    url); //canLaunch is from url_launcher package
                                                if (urllaunchable) {
                                                  await launch(
                                                      url); //launch is from url_launcher package to launch URL
                                                } else {
                                                  print(
                                                      "URL can't be launched.");
                                                }
                                              },
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10),
                                                    child: Image.asset(
                                                        'assets/credit/nissan.png'),
                                                  ),
                                                  Text(
                                                    'NISSAN',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                         fontSize: 18),
                                                  ),
                                                ],
                                              )))),
                                Container(
                                      child: ConstrainedBox(
                                          constraints: BoxConstraints.expand(),
                                          child: ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.deepPurpleAccent
                                                            ),
                                              ),
                                              onPressed: () async {
                                                String url =
                                                    "https://www.mitsubishi-motors.co.th/th/cars";
                                                var urllaunchable = await canLaunch(
                                                    url); //canLaunch is from url_launcher package
                                                if (urllaunchable) {
                                                  await launch(
                                                      url); //launch is from url_launcher package to launch URL
                                                } else {
                                                  print(
                                                      "URL can't be launched.");
                                                }
                                              },
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 15),
                                                    child: Image.asset(
                                                        'assets/credit/mitsu.png'),
                                                  ),
                                                  Text(
                                                    'MITSUBISHI',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                         fontSize: 16.5),
                                                        
                                                  ),
                                                ],
                                              )))),
                                    Container(
                                      child: ConstrainedBox(
                                          constraints: BoxConstraints.expand(),
                                          child: ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                           Colors.deepPurple.shade900),
                                              ),
                                              onPressed: () async {
                                                String url =
                                                    "https://www.autofun.co.th";
                                                var urllaunchable = await canLaunch(
                                                    url); //canLaunch is from url_launcher package
                                                if (urllaunchable) {
                                                  await launch(
                                                      url); //launch is from url_launcher package to launch URL
                                                } else {
                                                  print(
                                                      "URL can't be launched.");
                                                }
                                              },
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10),
                                                    child: Image.asset(
                                                        'assets/credit/autofun.jpg'),
                                                  ),
                                                  Text(
                                                    'AUTOFUN',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                         fontSize: 18),
                                                  ),
                                                ],
                                              )))),
                                    Container(
                                      child: ConstrainedBox(
                                          constraints: BoxConstraints.expand(),
                                          child: ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                          Colors.deepPurpleAccent),
                                              ),
                                              onPressed: () async {
                                                String url =
                                                    "https://chobrod.com/car-sale";
                                                var urllaunchable = await canLaunch(
                                                    url); //canLaunch is from url_launcher package
                                                if (urllaunchable) {
                                                  await launch(
                                                      url); //launch is from url_launcher package to launch URL
                                                } else {
                                                  print(
                                                      "URL can't be launched.");
                                                }
                                              },
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 20),
                                                    child: Image.asset(
                                                        'assets/credit/chobrod.png'),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Text(
                                                    'CHOBROD',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                          fontSize: 18),
                                                  ),
                                                ],
                                              )))),
                                 Container(
                                      child: ConstrainedBox(
                                          constraints: BoxConstraints.expand(),
                                          child: ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.deepPurple.shade900
                                                            ),
                                              ),
                                              onPressed: () async {
                                                String url =
                                                    "https://chobrod.com/car-sale";
                                                var urllaunchable = await canLaunch(
                                                    url); //canLaunch is from url_launcher package
                                                if (urllaunchable) {
                                                  await launch(
                                                      url); //launch is from url_launcher package to launch URL
                                                } else {
                                                  print(
                                                      "URL can't be launched.");
                                                }
                                              },
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10),
                                                    child: Image.asset(
                                                        'assets/credit/one2car.jpg'),
                                                  ),
                                                 
                                                  Text(
                                                    'ONE2CAR',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                       fontSize: 18),
                                                  ),
                                                ],
                                              )))),         
                                Container(
                                      child: ConstrainedBox(
                                          constraints: BoxConstraints.expand(),
                                          child: ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.deepPurpleAccent
                                                            ),
                                              ),
                                              onPressed: () async {
                                                String url =
                                                    "https://rod.kaidee.com";
                                                var urllaunchable = await canLaunch(
                                                    url); //canLaunch is from url_launcher package
                                                if (urllaunchable) {
                                                  await launch(
                                                      url); //launch is from url_launcher package to launch URL
                                                } else {
                                                  print(
                                                      "URL can't be launched.");
                                                }
                                              },
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10),
                                                    child: Image.asset(
                                                        'assets/credit/kaidee.jpg'),
                                                  ),
                                                 
                                                  Text(
                                                    'KAIDEE',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                          fontSize: 18),
                                                  ),
                                                ],
                                              )))),           
                                 Container(
                                      child: ConstrainedBox(
                                          constraints: BoxConstraints.expand(),
                                          child: ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                          Colors.deepPurple.shade900),
                                              ),
                                              onPressed: () async {
                                                String url =
                                                    "https://www.taladrod.com/w40/home/";
                                                var urllaunchable = await canLaunch(
                                                    url); //canLaunch is from url_launcher package
                                                if (urllaunchable) {
                                                  await launch(
                                                      url); //launch is from url_launcher package to launch URL
                                                } else {
                                                  print(
                                                      "URL can't be launched.");
                                                }
                                              },
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10),
                                                    child: Image.asset(
                                                        'assets/credit/ta.jpg'),
                                                  ),
                                                 
                                                  Text(
                                                    'TALADROD',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                          fontSize: 17),
                                                  ),
                                                ],
                                              )))),                
                                  Container(
                                      child: ConstrainedBox(
                                          constraints: BoxConstraints.expand(),
                                          child: ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                          Colors.deepPurpleAccent),
                                              ),
                                              onPressed: () async {
                                                String url =
                                                    "https://www.autospinn.com/category/รีวิวรถยนต์";
                                                var urllaunchable = await canLaunch(
                                                    url); //canLaunch is from url_launcher package
                                                if (urllaunchable) {
                                                  await launch(
                                                      url); //launch is from url_launcher package to launch URL
                                                } else {
                                                  print(
                                                      "URL can't be launched.");
                                                }
                                              },
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10),
                                                    child: Image.asset(
                                                        'assets/credit/autospinn.png'),
                                                  ),
                                                 
                                                  Text(
                                                    'AUTOSPINN',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                          fontSize: 16),
                                                  ),
                                                ],
                                              )))),                                                   
                                ],
                              ),
                            ),
                          )
                        ])))))));
  }
}
