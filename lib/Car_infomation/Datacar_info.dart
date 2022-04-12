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
        height: double.infinity,
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
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20.0),
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
                                                fontSize: 15.0,
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
                                              fontSize: 15.0,
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
                                    collapsedIconColor: Colors.deepPurple[200],
                                    iconColor: Colors.white,
                                    title: Text(
                                      'เบรกและล้อ',
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
                                        child: ListTile(
                                          title: Text(
                                            "\t: \t" +
                                                "${infocar["เบรก และ ล้อ"]}",
                                            style: TextStyle(
                                                fontSize: 15.0,
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
                                    collapsedIconColor: Colors.deepPurple[200],
                                    iconColor: Colors.white,
                                    title: Text(
                                      'ระบบการเตือนชนข้างหลัง',
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
                                        child: ListTile(
                                          title: Text(
                                            "\t: \t" +
                                                "${infocar["ระบบเตือนการชนด้านหน้า"]}",
                                            style: TextStyle(
                                                fontSize: 15.0,
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
                                    collapsedIconColor: Colors.deepPurple[200],
                                    iconColor: Colors.white,
                                    title: Text(
                                      'ระบบการเตือนชนข้างหลัง',
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
                                        child: ListTile(
                                          title: Text(
                                            "\t: \t" +
                                                "${infocar["ระบบเตือนการชนด้านหลัง"]}",
                                            style: TextStyle(
                                                fontSize: 15.0,
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
                                  collapsedIconColor: Colors.deepPurple[200],
                                  iconColor: Colors.white,
                                  title: Text(
                                    'ระบบเบรกฉุกเฉินอัตโนมัติ',
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
                                      child: ListTile(
                                        title: Text(
                                          "\t: \t" +
                                              "${infocar["ระบบการเบรกฉุกเฉิน"]}",
                                          style: TextStyle(
                                              fontSize: 15.0,
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
                                    collapsedIconColor: Colors.deepPurple[200],
                                    iconColor: Colors.white,
                                    title: Text(
                                      'ระบบช่วยออกตัวทางลาดชัน',
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
                                        child: ListTile(
                                          title: Text(
                                            "\t: \t" +
                                                "${infocar["ระบบช่วยออกตัวบนทางลาดชัน"]}",
                                            style: TextStyle(
                                                fontSize: 15.0,
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
                                    collapsedIconColor: Colors.deepPurple[200],
                                    iconColor: Colors.white,
                                    title: Text(
                                      'ระบบควบคุมความเร็วอัตโนมัติ',
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
                                        child: ListTile(
                                          title: Text(
                                            "\t: \t" +
                                                "${infocar["ระบบควบคุมความเร็วอัตโนมัติ"]}",
                                            style: TextStyle(
                                                fontSize: 15.0,
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
                                    collapsedIconColor: Colors.deepPurple[200],
                                    iconColor: Colors.white,
                                    title: Text(
                                      'ระบบช่วยควบคุมรถ',
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
                                        child: ListTile(
                                          title: Text(
                                            "\t: \t" +
                                                "${infocar["ระบบช่วยควบคุมรถ"]}",
                                            style: TextStyle(
                                                fontSize: 15.0,
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
                                    collapsedIconColor: Colors.deepPurple[200],
                                    iconColor: Colors.white,
                                    title: Text(
                                      'ระบบขับเคลื่อน',
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
                                        child: ListTile(
                                          title: Text(
                                            "\t: \t" +
                                                "${infocar["ระบบขับเคลื่อน"]}",
                                            style: TextStyle(
                                                fontSize: 15.0,
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
                                    collapsedIconColor: Colors.deepPurple[200],
                                    iconColor: Colors.white,
                                    title: Text(
                                      'ทัศนวิสัยในการขับรถ',
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
                                        child: ListTile(
                                          title: Text(
                                            "\t: \t" +
                                                "${infocar["ทัศนวิสัยในการขับรถ"]}",
                                            style: TextStyle(
                                                fontSize: 15.0,
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
                                    collapsedIconColor: Colors.deepPurple[200],
                                    iconColor: Colors.white,
                                    title: Text(
                                      'วัสดุเบาะนั่ง จำนวนที่นั่ง',
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
                                        child: ListTile(
                                          title: Text(
                                            "\t: \t" +
                                                "${infocar["วัสดุเบาะนั่ง จำนวนที่นั่ง"]}",
                                            style: TextStyle(
                                                fontSize: 15.0,
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
                                    collapsedIconColor: Colors.deepPurple[200],
                                    iconColor: Colors.white,
                                    title: Text(
                                      'แผงหน้าคอนโซลรถยนต์',
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
                                        child: ListTile(
                                          title: Text(
                                            "\t: \t" +
                                                "${infocar["แผงหน้าคอนโซลรถยนต์"]}",
                                            style: TextStyle(
                                                fontSize: 15.0,
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
                                    collapsedIconColor: Colors.deepPurple[200],
                                    iconColor: Colors.white,
                                    title: Text(
                                      'จอมัลติมีเดียเพิ่มความสะดวกสบาย (GPS music กล้องถอยหลัง) ',
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
                                        child: ListTile(
                                          title: Text(
                                            "\t: \t" +
                                                "${infocar["จอมัลติมีเดียเพิ่มความสะดวกสบาย"]}",
                                            style: TextStyle(
                                                fontSize: 15.0,
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
              );
            }),
      ),
    );
  }
}
