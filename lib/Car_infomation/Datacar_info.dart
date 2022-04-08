import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 100.0),
            ExpansionTile(
              title: Text(
                "ภายนอก",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              children: <Widget>[
                ExpansionTile(
                  title: Text(
                    'ระบบเกียร์',
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text("${infocar["ระบบเกียร์"]}"),
                    )
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    'เครื่องยนต์ / อัตราการกินน้ำมัน',
                  ),
                  children: <Widget>[
                    ListTile(
                      title:
                          Text("${infocar["เครื่องยนต์ / อัตราการกินน้ำมัน"]}"),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
