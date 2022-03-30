import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text('ข้อมูลวิธีการใช้งาน',style: TextStyle(fontFamily: 'Chakra'),),
        flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepPurple[400],Colors.deepPurple[200]],
                  stops: [0.2, 1.0],
                ),
              ),
            ),
      ),
      body: Container(
        child: Center(
          child: Container(
            child: const Align(
              alignment: FractionalOffset(0.52, 0.3),
              //alignment: Alignment.centerRight,
              child: Text(
                "ข้อมูลวิธีการใช้งาน",
                style: TextStyle(fontSize: 25,fontFamily: 'Chakra'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
