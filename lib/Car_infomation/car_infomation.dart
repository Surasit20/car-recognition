import 'package:flutter/material.dart';

class Carinfomation extends StatelessWidget {
  String namecar;
  Carinfomation({this.namecar});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(namecar),
    );
  }
}
