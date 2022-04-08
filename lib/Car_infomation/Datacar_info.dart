// ignore: unused_import
import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Datacarinfo extends StatefulWidget {
  var data;
  Datacarinfo({Key key, this.data}) : super(key: key);
  @override
  _DatacarinfoState createState() => _DatacarinfoState();
}

class _DatacarinfoState extends State<Datacarinfo> {
  var infocar;
  @override
  void initState() {
    super.initState();
    //เมื่อครบเวลา 5 วิ จะทำหน้าเปลี่ยนที่ไปหน้า OnBoardingPage

    infocar = widget.data;
    print(infocar["ระบบเกียร์"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'รายละเอียดของรุ่นย่อย',
          style: TextStyle(fontFamily: 'Chakra', fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple[400], Colors.deepPurple[200]],
              stops: [0.2, 1.0],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple[400], Colors.deepPurple[200]],
            stops: [0.2, 1.0],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 50.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: new BorderRadius.all(Radius.circular(10.0)),
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                  child: ExpansionTile(
                    collapsedIconColor: Colors.deepPurple[200],
                    iconColor: Colors.white,
                    title: Text(
                      "ภายนอก",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Chakra',
                          color: Colors.white),
                    ),
                    children: <Widget>[
                      ExpansionTile(
                        collapsedIconColor: Colors.deepPurple[200],
                        iconColor: Colors.white,
                        title: Text(
                          'ระบบเกียร์',
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Chakra',
                              color: Colors.white),
                        ),
                        children: <Widget>[
                          ListTile(
                            title: Text(
                                 "\t: \t"+"${infocar["ระบบเกียร์"]}",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Chakra',
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      ExpansionTile(
                        collapsedIconColor: Colors.deepPurple[200],
                        iconColor: Colors.white,
                        title: Text(
                          'เครื่องยนต์ / อัตราการกินน้ำมัน',
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Chakra',
                              color: Colors.white),
                        ),
                        children: <Widget>[
                          ListTile(
                            title: Text(
                               "\t: \t"+"${infocar["เครื่องยนต์ / อัตราการกินน้ำมัน"]}",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Chakra',
                                  color: Colors.white),
                            ),
                          )
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
    );
  }
}
