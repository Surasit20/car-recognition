// ignore: unused_import
// ignore_for_file: unused_field

import "dart:convert";
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Car_infomation/Datacar_info.dart';

// ignore: must_be_immutable
class Carinfomation extends StatefulWidget {
  String namecar;
  Carinfomation({Key key, this.namecar}) : super(key: key);
  @override
  _CarinfomationState createState() => _CarinfomationState();
}

class _CarinfomationState extends State<Carinfomation> {
  var _items;
  var _itemCar;
  var _itemBasic;

  // Fetch content from the json file
  void readJson() async {
    final String response =
        await rootBundle.loadString('assets/datacar/data.json');
    final data = await json.decode(response);

    setState(() {
      _items = data[widget.namecar] ?? [null, null];
      _itemCar = _items[1];
      _itemBasic = _items[0];
    });
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.deepPurple[400],
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple[400], Colors.deepPurple[200]],
            stops: [0.2, 1.0],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Text(
                  widget.namecar,
                  style: TextStyle(
                      fontFamily: 'Chakra',
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
               /*Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child:  Text("${_itemBasic["ประเภทรถยนต์"]+["ราคาเปิดตัว"]}",
                  style: TextStyle(
                      fontFamily: 'Chakra',
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),*/
             

              // Display the data loaded from sample.json
              (_itemCar != null)
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: _itemCar.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.all(10),
                            child: Container(
                              height: 70,
                              // ignore: deprecated_member_use
                              child: RaisedButton(
                                color: Colors.white,
                                /*shape: StadiumBorder(
                                  side: BorderSide(
                                      color: Colors.deepPurple[800], width: 3),
                                ),*/
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Datacarinfo(
                                              data: _itemCar[index])));
                                },
                                child: ListTile(
                                  leading: Text(
                                    "รุ่น : \t" + _itemCar[index]["ชื่อรุ่น"],
                                    style: TextStyle(
                                        fontFamily: 'Chakra',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),

                                  //title: Text(_items[index]["ประเภทรถยนต์"],style: TextStyle(fontFamily: 'Chakra',fontWeight: FontWeight.bold),),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
