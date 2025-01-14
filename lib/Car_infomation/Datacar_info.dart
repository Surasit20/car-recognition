// ignore: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home/Newselectcar.dart';
import 'package:flutter_application_1/sizes_helpers.dart';

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

    infocar = widget.data;
    print(infocar);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: displayWidth(context) * 1,
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
          child: StreamBuilder<Object>(
              stream: null,
              builder: (context, snapshot) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 20.0),
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
                            
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Stack(
                                  children: <Widget>[
                                    // Stroked text as border.
                                    /*Text(
                                      'ราคาเปิดตัว',
                                      style: TextStyle(
                                        fontSize: 30,
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 4
                                          ..color = Color.fromARGB(255, 216, 160, 118),
                                      ),
                                    ),
                                    // Solid text as fill.
                                    Text(
                                       'ราคาเปิดตัว',
                                      style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.orangeAccent[300],
                                      ),
                                    ),*/
                                    Text(
  'ราคาเปิดตัว',
  style: TextStyle(
    fontSize: 35,
    color: Colors.deepPurpleAccent[400],
    shadows: <Shadow>[
      Shadow(
        offset: Offset(0.0, 3.0),
        blurRadius: 3,
        color: Colors.deepPurpleAccent[400],
      ),
      Shadow(
        offset: Offset(0.0, 10.0),
        blurRadius: 30.0,
        color: Colors.deepOrange[600],
      ),
    ],
  ),
),
                                  ],
                                ),
                                  Stack(
                                  children: <Widget>[
                                    // Stroked text as border.
                                    Text(
                                      'ชื่อรุ่น : ${infocar["ชื่อรุ่น"]}',
                                      style: TextStyle(
                                        fontSize: 25,
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 5
                                          ..color = Colors.deepPurpleAccent[400],
                                      ),
                                    ),
                                    // Solid text as fill.
                                    Text(
                                       'ชื่อรุ่น : ${infocar["ชื่อรุ่น"]}',
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: Color.fromARGB(255, 255, 255, 255)                             ),
                                    ),
                                  ],
                                ),
                                 Stack(
                                  children: <Widget>[
                                    // Stroked text as border.
                                    Text(
                                      "${infocar["ราคาเปิดตัว"]}",
                                      style: TextStyle(
                                        fontSize: 25,
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 5
                                          ..color = Colors.deepPurple[800],
                                      ),
                                    ),
                                    // Solid text as fill.
                                    Text(
                                      "${infocar["ราคาเปิดตัว"]}",
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: Color.fromARGB(255, 255, 255, 255),
                                      ),
                                    ),
                                  ],
                                ),
                                ],
                              ),

                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
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
                                    new BorderRadius.all(Radius.circular(10.0)),
                                border: Border.all(
                                  color: Colors.white,
                                ),
                              ),
                              child: Container(
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
                                    Container(
                                      child: ExpansionTile(
                                        collapsedIconColor:
                                            Colors.deepPurple[200],
                                        iconColor: Colors.white,
                                        title: Text(
                                          'ระบบเกียร์',
                                          style: TextStyle(
                                              fontSize: 17.0,
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
                                            child: ListTile(
                                              title: Text(
                                                "\t: \t" +
                                                    "${infocar["ระบบเกียร์"]}",
                                                style: TextStyle(
                                                    fontSize: 17.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Chakra',
                                                    color: Colors.deepPurple),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    ExpansionTile(
                                      collapsedIconColor:
                                          Colors.deepPurple[200],
                                      iconColor: Colors.white,
                                      title: Text(
                                        'เครื่องยนต์ / อัตราการกินน้ำมัน',
                                        style: TextStyle(
                                           fontSize: 17.0,
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
                                          child: ListTile(
                                            title: Text(
                                              "\t: \t" +
                                                  "${infocar["เครื่องยนต์ / อัตราการกินน้ำมัน"]}",
                                              style: TextStyle(
                                                 fontSize: 17.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Chakra',
                                                  color: Colors.deepPurple),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                      child: ExpansionTile(
                                        collapsedIconColor:
                                            Colors.deepPurple[200],
                                        iconColor: Colors.white,
                                        title: Text(
                                          'เบรกและล้อ',
                                          style: TextStyle(
                                               fontSize: 17.0,
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
                                            child: ListTile(
                                              title: Text(
                                                "\t: \t" +
                                                    "${infocar["เบรก และ ล้อ"]}",
                                                style: TextStyle(
                                                  fontSize: 17.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Chakra',
                                                    color: Colors.deepPurple),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ////////////////////////////////////// ภายใน /////////////////////////////////
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
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
                                    new BorderRadius.all(Radius.circular(10.0)),
                                border: Border.all(
                                  color: Colors.white,
                                ),
                              ),
                              child: Container(
                                child: ExpansionTile(
                                  collapsedIconColor: Colors.deepPurple[200],
                                  iconColor: Colors.white,
                                  title: Text(
                                    "ภายใน",
                                    style: TextStyle(
                                        fontSize: 20.0,
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
                                          'ระบบการเตือนชนข้างหน้า',
                                          style: TextStyle(
                                               fontSize: 17.0,
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
                                            child: ListTile(
                                              title: Text(
                                                "\t: \t" +
                                                    "${infocar["ระบบเตือนการชนด้านหน้า"]}",
                                                style: TextStyle(
                                                     fontSize: 17.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Chakra',
                                                    color: Colors.deepPurple),
                                              ),
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
                                          'ระบบการเตือนชนข้างหลัง',
                                          style: TextStyle(
                                               fontSize: 17.0,
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
                                            child: ListTile(
                                              title: Text(
                                                "\t: \t" +
                                                    "${infocar["ระบบเตือนการชนด้านหลัง"]}",
                                                style: TextStyle(
                                                  fontSize: 17.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Chakra',
                                                    color: Colors.deepPurple),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    ExpansionTile(
                                      collapsedIconColor:
                                          Colors.deepPurple[200],
                                      iconColor: Colors.white,
                                      title: Text(
                                        'ระบบเบรกฉุกเฉินอัตโนมัติ',
                                        style: TextStyle(
                                            fontSize: 17.0,
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
                                          child: ListTile(
                                            title: Text(
                                              "\t: \t" +
                                                  "${infocar["ระบบการเบรกฉุกเฉิน"]}",
                                              style: TextStyle(
                                                  fontSize: 17.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Chakra',
                                                  color: Colors.deepPurple),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                      child: ExpansionTile(
                                        collapsedIconColor:
                                            Colors.deepPurple[200],
                                        iconColor: Colors.white,
                                        title: Text(
                                          'ระบบช่วยออกตัวทางลาดชัน',
                                          style: TextStyle(
                                               fontSize: 17.0,
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
                                            child: ListTile(
                                              title: Text(
                                                "\t: \t" +
                                                    "${infocar["ระบบช่วยออกตัวบนทางลาดชัน"]}",
                                                style: TextStyle(
                                                    fontSize: 17.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Chakra',
                                                    color: Colors.deepPurple),
                                              ),
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
                                          'ระบบควบคุมความเร็วอัตโนมัติ',
                                          style: TextStyle(
                                              fontSize: 17.0,
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
                                            child: ListTile(
                                              title: Text(
                                                "\t: \t" +
                                                    "${infocar["ระบบควบคุมความเร็วอัตโนมัติ"]}",
                                                style: TextStyle(
                                                   fontSize: 17.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Chakra',
                                                    color: Colors.deepPurple),
                                              ),
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
                                          'ระบบช่วยควบคุมรถ',
                                          style: TextStyle(
                                              fontSize: 17.0,
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
                                            child: ListTile(
                                              title: Text(
                                                "\t: \t" +
                                                    "${infocar["ระบบช่วยควบคุมรถ"]}",
                                                style: TextStyle(
                                                   fontSize: 17.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Chakra',
                                                    color: Colors.deepPurple),
                                              ),
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
                                          'ระบบขับเคลื่อน',
                                          style: TextStyle(
                                               fontSize: 17.0,
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
                                            child: ListTile(
                                              title: Text(
                                                "\t: \t" +
                                                    "${infocar["ระบบขับเคลื่อน"]}",
                                                style: TextStyle(
                                                     fontSize: 17.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Chakra',
                                                    color: Colors.deepPurple),
                                              ),
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
                                          'ทัศนวิสัยในการขับรถ',
                                          style: TextStyle(
                                               fontSize: 17.0,
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
                                            child: ListTile(
                                              title: Text(
                                                "\t: \t" +
                                                    "${infocar["ทัศนวิสัยในการขับรถ"]}",
                                                style: TextStyle(
                                                   fontSize: 17.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Chakra',
                                                    color: Colors.deepPurple),
                                              ),
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
                                          'วัสดุเบาะนั่ง จำนวนที่นั่ง',
                                          style: TextStyle(
                                             fontSize: 17.0,
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
                                            child: ListTile(
                                              title: Text(
                                                "\t: \t" +
                                                    "${infocar["วัสดุเบาะนั่ง จำนวนที่นั่ง"]}",
                                                style: TextStyle(
                                                   fontSize: 17.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Chakra',
                                                    color: Colors.deepPurple),
                                              ),
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
                                          'แผงหน้าคอนโซลรถยนต์',
                                          style: TextStyle(
                                              fontSize: 17.0,
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
                                            child: ListTile(
                                              title: Text(
                                                "\t: \t" +
                                                    "${infocar["แผงหน้าคอนโซลรถยนต์"]}",
                                                style: TextStyle(
                                                    fontSize: 17.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Chakra',
                                                    color: Colors.deepPurple),
                                              ),
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
                                          'จอมัลติมีเดียเพิ่มความสะดวกสบาย (GPS music กล้องถอยหลัง) ',
                                          style: TextStyle(
                                               fontSize: 17.0,
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
                                            child: ListTile(
                                              title: Text(
                                                "\t: \t" +
                                                    "${infocar["จอมัลติมีเดียเพิ่มความสะดวกสบาย"]}",
                                                style: TextStyle(
                                                    fontSize: 17.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Chakra',
                                                    color: Colors.deepPurple),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
