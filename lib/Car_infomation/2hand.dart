// ignore: unused_import

import 'dart:convert';
// ignore: unused_import
import 'package:http/http.dart' as http;
// ignore: unused_import
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
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
  // ignore: avoid_init_to_null
  var _price2hand = null;
  // Fetch content from the json file

  Future<void> getRequest() async {
    String url =
        "https://us-central1-used-car-history-price.cloudfunctions.net/price/";
    final response = await http.get(Uri.parse(url));
    var responseData = json.decode(response.body);
    setState(() {
      _price2hand = responseData;
    });
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();

    getRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                                      Container(
                                        child: ExpansionTile(
                                          collapsedIconColor:
                                              Colors.deepPurple[200],
                                          iconColor: Colors.white,
                                          title: Text(
                                            'ราคามือสองช่วงแรก',
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Chakra',
                                                color: Colors.white),
                                          ),
                                          children: <Widget>[
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                  width: 5,
                                                  color: Colors.deepPurple[100],
                                                ),
                                              ),
                                              child: Column(
                                                children: [
                                                  ListTile(
                                                    title: Text(
                                                      "\t: \t" +
                                                          "ราคาสูงสุด ${_price2hand[0]["max"].toString()}",
                                                      style: TextStyle(
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily: 'Chakra',
                                                          color: Colors
                                                              .deepPurple),
                                                    ),
                                                  ),
                                                  ListTile(
                                                    title: Text(
                                                      "\t: \t" +
                                                          "ราคาต่ำสุด ${_price2hand[0]["min"].toString()}",
                                                      style: TextStyle(
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily: 'Chakra',
                                                          color: Colors
                                                              .deepPurple),
                                                    ),
                                                  ),
                                                  ListTile(
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
                                                  ),
                                                  ListTile(
                                                    title: Text(
                                                      "\t: \t" +
                                                          "ปี ${_price2hand[0]["year"].toString()}",
                                                      style: TextStyle(
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily: 'Chakra',
                                                          color: Colors
                                                              .deepPurple),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: ExpansionTile(
                                          collapsedIconColor:
                                              Colors.deepPurple[200],
                                          iconColor: Colors.white,
                                          title: Text(
                                            'ราคามือสองช่วงสอง',
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Chakra',
                                                color: Colors.white),
                                          ),
                                          children: <Widget>[
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                  width: 5,
                                                  color: Colors.deepPurple[100],
                                                ),
                                              ),
                                              child: Column(
                                                children: [
                                                  ListTile(
                                                    title: Text(
                                                      "\t: \t" +
                                                          "ราคาสูงสุด ${_price2hand[1]["max"].toString()}",
                                                      style: TextStyle(
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily: 'Chakra',
                                                          color: Colors
                                                              .deepPurple),
                                                    ),
                                                  ),
                                                  ListTile(
                                                    title: Text(
                                                      "\t: \t" +
                                                          "ราคาต่ำสุด ${_price2hand[1]["min"].toString()}",
                                                      style: TextStyle(
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily: 'Chakra',
                                                          color: Colors
                                                              .deepPurple),
                                                    ),
                                                  ),
                                                  ListTile(
                                                    title: Text(
                                                      "\t: \t" +
                                                          "ช่วงเดือนที่ ${_price2hand[1]["month"].toString()}",
                                                      style: TextStyle(
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily: 'Chakra',
                                                          color: Colors
                                                              .deepPurple),
                                                    ),
                                                  ),
                                                  ListTile(
                                                    title: Text(
                                                      "\t: \t" +
                                                          "ปี ${_price2hand[1]["year"].toString()}",
                                                      style: TextStyle(
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily: 'Chakra',
                                                          color: Colors
                                                              .deepPurple),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ])))),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
