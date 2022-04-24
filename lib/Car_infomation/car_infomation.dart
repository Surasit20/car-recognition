// ignore: unused_import
// ignore_for_file: unused_field

import "dart:convert";
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Car_infomation/2hand.dart';
import 'package:flutter_application_1/Car_infomation/Datacar_info.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class Carinfomation extends StatefulWidget {
  String namecar;
  Carinfomation({Key key, this.namecar}) : super(key: key);
  @override
  _CarinfomationState createState() => _CarinfomationState();
}

class _CarinfomationState extends State<Carinfomation> {
  var _items;
  var _itemCar, _itemBasic;
  var _type, _price, _listPhoto;
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

  void readJson() async {
    final String response =
        await rootBundle.loadString('assets/datacar/data.json');
    final data = await json.decode(response);

    setState(() {
      _items = data[widget.namecar] ?? [null, null];
      _itemCar = _items[1];
      _itemBasic = _items[0] ?? "";

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
    getRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.deepPurple[400],
      body: Container(
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
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Container(
            child: Column(
              children: [
                /*Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: Text(
                    widget.namecar,
                    style: TextStyle(
                        fontFamily: 'Chakra',
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),*/
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 0),
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    height: 35,
                    width: double.maxFinite,
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
                            widget.namecar,
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Text(
                    "ประเภทรถยนต์ : $_type ", //\nราคาเปิดตัว : $_price",
                    style: TextStyle(
                        fontFamily: 'Chakra',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.deepPurple),
                  ),
                ),
                
                SizedBox(
                  height: 10,
                ),
                (_listPhoto != null)
                    ? Container(
                        child: Column(
                          children: [
                            Card(
                              child: Container(
                                height: 200,
                                width: 300,
                                child: Image.asset(
                                  _listPhoto[0],
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Text(""),
                    (_price2hand == null)
                    ? Center(
                            child: Container(
                              child: CircularProgressIndicator(
                                color: Colors.deepPurple,
                              ),
                            ),
                          )
                   : 
           Container(
              height: 70,
             child: Padding(
               padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                        padding: const EdgeInsets.all(16.0),
                        primary: Colors.white,
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () { Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Twohand()));
                                                          },
                      child: const Text('ราคามือสอง'),
                    ),
                  ],
                ),
          ),
             ),
           ),
             
                (_itemCar != null)
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: _itemCar.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(10),
                                  child: Container(
                                    height: 50,
                                    // ignore: deprecated_member_use
                                    child: RaisedButton(
                                      color: Colors.deepPurple,
                                      /*shape: StadiumBorder(
                                          side: BorderSide(
                                              color: Colors.deepPurple[800], width: 3),
                                        ),*/
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Datacarinfo(
                                                        data:
                                                            _itemCar[index])));
                                      },
                                      child: ListTile(
                                        leading: Text(
                                          "รุ่น : \t" +
                                              _itemCar[index]["ชื่อรุ่น"],
                                          style: TextStyle(
                                              fontFamily: 'Chakra',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
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
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
