// ignore_for_file: unused_import, avoid_init_to_null

import 'dart:convert';
import 'package:flutter_application_1/Car_infomation/ModeLabel.dart';
import 'package:flutter_application_1/Home/Newselectcar.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/sizes_helpers.dart';
import 'package:intl/intl.dart';

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
  final oCcy = new NumberFormat("#,##0.00", "en_US");
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
    "Nissan Terra": "terra",
    "Pajero Sport": "pajero",
    "Revo Rocco": "revo",
    "Toyota Yaris Sport Hatchback": "yaris",
  };

  final _month = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12"
  ];
  Future<void> getRequest() async {
    final name = mapToLabel[widget.data];
    print(name);
    String url = "https://api-get-price.onrender.com/$name";

    try {
      final response = await http.get(Uri.parse(url));
      var responseData = json.decode(response.body);

      setState(() {
        _price2hand = responseData;
      });

      print(responseData);
    } catch (err) {
      setState(() {
        _price2hand = [];
      });
    }
  }

  void getData() {
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);
    List<String> list = <String>[];
    print(date.year);
    int year = 2020;
    int lastmonth = now.month;
    bool a = true;
    while (a) {
      year += 1;
      if (date.year >= year) {
        list.add(year.toString());
      } else {
        a = false;
      }
    }

    print(list);

    setState(() {
      _yearList = list;
    });
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    print(widget.data);
    getRequest();
    getData();
  }

  List<String> list = <String>['One', 'Two', 'Three', 'Four'];
  List<String> _yearList = <String>[];
  List<String> _monthList = <String>[
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12"
  ];

  String dropdownValue = "One";
  String dropdownValueYear = "2021";
  String dropdownValueMonth = "1";
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
                            Row(
                              children: [
                                DropdownButton<String>(
                                  value: dropdownValueYear,
                                  icon: const Icon(Icons.arrow_downward),
                                  elevation: 16,
                                  style:
                                      const TextStyle(color: Colors.deepPurple),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                  onChanged: (String value) {
                                    // This is called when the user selects an item.
                                    setState(() {
                                      dropdownValueYear = value;
                                    });
                                  },
                                  items: _yearList
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                                DropdownButton<String>(
                                  value: dropdownValueMonth,
                                  icon: const Icon(Icons.arrow_downward),
                                  elevation: 16,
                                  style:
                                      const TextStyle(color: Colors.deepPurple),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                  onChanged: (String value) {
                                    // This is called when the user selects an item.
                                    setState(() {
                                      dropdownValueMonth = value;
                                    });
                                  },
                                  items: _monthList
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                            (_price2hand == null)
                                ? Center(
                                    child: Container(
                                      child: CircularProgressIndicator(
                                        color: Colors.deepPurple,
                                      ),
                                    ),
                                  )
                                : _price2hand != []
                                    ? Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 10, 0, 0),
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
                                              borderRadius:
                                                  new BorderRadius.all(
                                                      Radius.circular(10.0)),
                                              border: Border.all(
                                                color: Colors.white,
                                              ),
                                            ),
                                            child: Container(
                                              child:
                                                  _price2hand.toString() != "[]"
                                                      ? ExpansionTile(
                                                          initiallyExpanded:
                                                              true,
                                                          collapsedIconColor:
                                                              Colors.deepPurple[
                                                                  200],
                                                          iconColor:
                                                              Colors.white,
                                                          title: Text(
                                                            "ราคามือสอง",
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    'Chakra',
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          children: <Widget>[
                                                              for (var i
                                                                  in _price2hand)
                                                                (dropdownValueMonth ==
                                                                            i[
                                                                                "month"] &&
                                                                        dropdownValueYear ==
                                                                            i["year"])
                                                                    ? Container(
                                                                        child:
                                                                            ExpansionTile(
                                                                          collapsedIconColor:
                                                                              Colors.deepPurple[200],
                                                                          iconColor:
                                                                              Colors.white,
                                                                          title:
                                                                              Text(
                                                                            'ราคามือสอง   ${i["month"].toString()} / ${i["year"]}',
                                                                            style: TextStyle(
                                                                                fontSize: 15.0,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontFamily: 'Chakra',
                                                                                color: Colors.white),
                                                                          ),
                                                                          children: <
                                                                              Widget>[
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
                                                                                  i["max"] != "ไม่มีข้อมูล"
                                                                                      ? ListTile(
                                                                                          title: Text(
                                                                                            "\t: \t" + "ราคาสูงสุด  ${oCcy.format(int.parse(i["max"].toString()))} บาท ",
                                                                                            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'Chakra', color: Colors.deepPurple),
                                                                                          ),
                                                                                        )
                                                                                      : ListTile(
                                                                                          title: Text(
                                                                                            "\t: \t" + "ราคาสูงสุด  ${i["max"].toString()}",
                                                                                            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'Chakra', color: Colors.deepPurple),
                                                                                          ),
                                                                                        ),
                                                                                  i["min"] != "ไม่มีข้อมูล"
                                                                                      ? ListTile(
                                                                                          title: Text(
                                                                                            "\t: \t" + "ราคาต่ำสุด ${oCcy.format(int.parse(i["min"].toString()))} บาท",
                                                                                            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'Chakra', color: Colors.deepPurple),
                                                                                          ),
                                                                                        )
                                                                                      : ListTile(
                                                                                          title: Text(
                                                                                            "\t: \t" + "ราคาต่ำสุด ${i["min"].toString()}",
                                                                                            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, fontFamily: 'Chakra', color: Colors.deepPurple),
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
                                                                      )
                                                                    : Container()
                                                            ])
                                                      : Text("ไม่พบข้อมูล"),
                                            )))
                                    : Text(""),
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
