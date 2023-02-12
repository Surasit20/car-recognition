import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Bottombar/home_page.dart';
import 'package:flutter_application_1/Car_infomation/2hand.dart';
import 'package:flutter_application_1/Car_infomation/Datacar_info.dart';
import 'package:flutter_application_1/circular_clipper.dart';
import 'package:flutter_application_1/sizes_helpers.dart';

class Carinfomation1 extends StatefulWidget {
  String namecar;
  Carinfomation1({Key key, this.namecar}) : super(key: key);
  @override
  _Carinfomation1State createState() => _Carinfomation1State();
}

class _Carinfomation1State extends State<Carinfomation1> {
  var _items;
  var _itemCar, _itemBasic;
  var _type, _price, _listPhoto, _namecar;
  // ignore: avoid_init_to_null

  void readJson() async {
    final String response =
        await rootBundle.loadString('assets/datacar/data.json');
    final data = await json.decode(response);

    setState(() {
      _items = data[widget.namecar] ?? [null, null];
      _itemCar = _items[1];
      _itemBasic = _items[0] ?? "";

      _namecar = _itemBasic["ยี่ห้อรถยนต์"];
      _type = _itemBasic["ประเภทรถยนต์"];
      _price = _itemBasic["ราคาเปิดตัว"];
      _listPhoto = _itemBasic["รูปภาพ"] ?? "";
    });
  }

  int _current = 0;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
          child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: displayHeight(context),
            decoration: BoxDecoration(
              /* gradient: LinearGradient(
                  colors: [Colors.deepPurple[400], Colors.deepPurple[200]],
                  stops: [0.2, 1.0],
                ),*/
              image: DecorationImage(
                image: AssetImage("assets/intro.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    (_listPhoto != null)
                        ? Container(
                            transform:
                                Matrix4.translationValues(0.0, -70.0, 0.0),
                            child: Hero(
                              tag: widget,
                              child: ClipShadowPath(
                                clipper: CircularClipper(),
                                shadow: Shadow(
                                  blurRadius: 50.0,
                                  color: Colors.deepPurple,
                                ),
                                child: Image(
                                  width: displayWidth(context),
                                  height: 350,
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    _listPhoto[0],
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Text(""),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
                          child: Container(
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
                                  onPressed: () => Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Home())),
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
                        ),
                      ],
                    ),
                    Positioned.fill(
                      bottom: 50.0,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 0),
                            padding: EdgeInsets.symmetric(horizontal: 0),
                            height: 50,
                            width: displayWidth(context),
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
                                    "$_namecar",
                                    style: TextStyle(
                                        color: Colors.deepPurple,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: 'Chakra',
                                        fontSize: displayWidth(context) * 0.05),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            alignment: FractionalOffset.bottomCenter,
                            child: Text(
                              "ประเภทรถยนต์ : $_type",
                              style: TextStyle(
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Chakra',
                                  fontSize: displayWidth(context) * 0.05),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 5.0),
                    Container(
                      alignment: FractionalOffset.center,
                      width: 150,
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Stack(
                            children: <Widget>[
                              Positioned.fill(
                                child: Container(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: <Color>[
                                        Colors.deepPurple,
                                        Color.fromARGB(255, 103, 68, 161),
                                        Color.fromARGB(255, 163, 135, 209),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.all(0),
                                  primary: Colors.white,
                                  textStyle: const TextStyle(fontSize: 20),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Twohand(
                                                data: widget.namecar,
                                              )));
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'ราคามือสอง',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'Chakra',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 12.0),
                    Text(
                      '⭐🚘⭐',
                      style: TextStyle(fontSize: 25.0),
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                              'โดยรายละเอียดข้อมูลรถยนต์',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                              ),
                            ),
                            Text(
                              'เป็นข้อมูลรถยนต์ของปี พ.ศ. 2564',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    (_itemCar != null)
                        ? Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Container(
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
                              height: 200,
                              width: displayWidth(context),
                              child: ListView.builder(
                                itemCount: _itemCar.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.all(10),
                                        child: Container(
                                          height: displayHeight(context) * 0.08,
                                          width: displayWidth(context) * 1,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.deepPurple,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        23), // <-- Radius
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Datacarinfo(
                                                              data: _itemCar[
                                                                  index])));
                                            },
                                            child: ListTile(
                                              leading: Text(
                                                "รุ่น : \t" +
                                                    _itemCar[index]["ชื่อรุ่น"],
                                                style: TextStyle(
                                                    fontFamily: 'Chakra',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        displayWidth(context) *
                                                            0.04,
                                                    color: Colors.white),
                                              ),

                                              //title: Text(_items[index]["ประเภทรถยนต์"],style: TextStyle(fontFamily: 'Chakra',fontWeight: FontWeight.bold),),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
