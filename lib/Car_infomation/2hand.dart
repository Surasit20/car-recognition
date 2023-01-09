// ignore_for_file: unused_import, avoid_init_to_null

import 'dart:convert';
import 'package:flutter_application_1/Car_infomation/ModeLabel.dart';
import 'package:flutter_application_1/Home/Newselectcar.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/sizes_helpers.dart';

// ignore: must_be_immutable
class Twohand extends StatefulWidget {
  var data;
  Twohand({Key key, this.data}) : super(key: key);
  @override
  _TwohandState createState() => _TwohandState();
}

class _TwohandState extends State<Twohand> {
  var infocar;
  var _price2hand = null;
  ModelLabel getdata;

  final mapToLabel = {
    "ALL new X-series Hilandeder DoubleCab": "xseries",
    "Attrage": "attrage",
    "CR-V": "crv",
    "City hatchback": "city",
    "Civic hatchback": "civic",
    "Corolla cross": "corolla",
    "Fortuner Legender": "fortuner",
    "GR Supra": "supra",
    "Isuzu Mu-x": "mux",
    "Jazz": "jazz",
    "Mitsu Outlander": "outlander",
    "Nissan Note": "note",
    "Nissan march": "march",
    "Nissan navara DCpro": "navara",
    "Nissan Terra": "ะerra",
    "Pajero Sport": "pajero",
    "Revo Rocco": "revo",
    "Toyota Yaris Sport Hatchback": "yaris",
  };

  Future<void> getRequest() async {
    final name = mapToLabel[widget.data];
    print(name);
    String url = "https://api-get-price.onrender.com/$name";

    final response = await http.get(Uri.parse(url));
    var responseData = json.decode(response.body);
    print(responseData);
    setState(() {
      _price2hand = responseData;
    });
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    print(widget.data);
    getRequest();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Colors.deepPurple[400],
        body: Container(
          height: displayHeight(context) * 1,
          width: displayWidth(context) * 1,
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
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
                child: Container(
                  child: Column(
                    children: [
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
                                      builder: (context) =>
                                          Newpageselectcar())),
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          (_price2hand == null)
                              ? Center(
                                  child: Container(
                                    child: CircularProgressIndicator(
                                      color: Colors.deepPurple,
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            offset: Offset(0, 15),
                                            blurRadius: 50,
                                            color: Colors.deepPurple[200],
                                          ),
                                        ],
                                        color: Colors.deepPurple,
                                        borderRadius: new BorderRadius.all(
                                            Radius.circular(10.0)),
                                        border: Border.all(
                                          color: Colors.white,
                                        ),
                                      ),
                                      child: Container(
                                          child: ExpansionTile(
                                              initiallyExpanded: true,
                                              collapsedIconColor:
                                                  Colors.deepPurple[200],
                                              iconColor: Colors.white,
                                              title: Text(
                                                "ราคามือสอง",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Chakra',
                                                    color: Colors.white),
                                              ),
                                              children: <Widget>[
                                            for (var i in _price2hand)
                                              Container(
                                                child: ExpansionTile(
                                                  collapsedIconColor:
                                                      Colors.deepPurple[200],
                                                  iconColor: Colors.white,
                                                  title: Text(
                                                    'ราคามือสอง ${i["month"]} / ${i["year"]}',
                                                    style: TextStyle(
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: 'Chakra',
                                                        color: Colors.white),
                                                  ),
                                                  children: <Widget>[
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        border: Border.all(
                                                          width: 5,
                                                          color: Colors
                                                              .deepPurple[100],
                                                        ),
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          ListTile(
                                                            title: Text(
                                                              "\t: \t" +
                                                                  "ราคาสูงสุด ${i["max"]} บาท",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      15.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontFamily:
                                                                      'Chakra',
                                                                  color: Colors
                                                                      .deepPurple),
                                                            ),
                                                          ),
                                                          ListTile(
                                                            title: Text(
                                                              "\t: \t" +
                                                                  "ราคาต่ำสุด ${i["min"]} บาท",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      15.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontFamily:
                                                                      'Chakra',
                                                                  color: Colors
                                                                      .deepPurple),
                                                            ),
                                                          ),
                                                          /* ListTile(
                                                                title: Text(
                                                                  "\t: \t" +
                                                                      "ช่วงเดือนที่ ${_price2hand[0]["month"].toString()}",
                                                                  style: TextStyle(
                                                                      fontSize: 15.0,
                                                                      fontWeight:
                                                                          FontWeight.bold,
                                                                      fontFamily: 'Chakra',
                                                                      color: Colors
                                                                          .deepPurple),
                                                                ),
                                                              ),*/
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                          ])))),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
