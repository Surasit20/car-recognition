import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';

class Datacarinfo extends StatefulWidget {
  var data;
  Datacarinfo({Key key, this.data}) : super(key: key);
  @override
  _DatacarinfoState createState() => _DatacarinfoState();
}

class _DatacarinfoState extends State<Datacarinfo> {
  @override
  void initState() {
    super.initState();
    //เมื่อครบเวลา 5 วิ จะทำหน้าเปลี่ยนที่ไปหน้า OnBoardingPage
    print(widget.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [
                0.1,
                0.5,
                0.8,
                1.0
              ],
              colors: [
                Color(0xFFF5F5F5), // backgroud   //เฉดสีพื้นหลัง
                Colors.white,
                Colors.white,
                Colors.white,
              ]),
        ),
      ),
    );
  }
}
