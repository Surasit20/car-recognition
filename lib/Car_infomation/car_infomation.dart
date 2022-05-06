import "dart:convert";
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Car_infomation/2hand.dart';
import 'package:flutter_application_1/Car_infomation/Datacar_info.dart';
import 'package:flutter_application_1/Home/Newselectcar.dart';
import 'package:flutter_application_1/sizes_helpers.dart';

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
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 40, 10, 0),
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 0),
                padding: EdgeInsets.symmetric(horizontal: 0),
                height: 40,
                width: double.infinity,
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
                            fontSize: displayWidth(context) * 0.04),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Container(
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
                              builder: (context) => Newpageselectcar())),
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
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
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
            Container(
              alignment: FractionalOffset.center,
              width: 150,
              height: 60,
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
            SizedBox(
              height: 10,
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
                                height: displayHeight(context) * 0.08,
                                width: displayWidth(context) * 1,
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
                                            builder: (context) => Datacarinfo(
                                                data: _itemCar[index])));
                                  },
                                  child: ListTile(
                                    leading: Text(
                                      "รุ่น : \t" + _itemCar[index]["ชื่อรุ่น"],
                                      style: TextStyle(
                                          fontFamily: 'Chakra',
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              displayWidth(context) * 0.04,
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
    );
  }
}
