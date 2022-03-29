import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
 
class Basic extends StatelessWidget{
 
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
        body: Center(
          child: CarouselSlider(
              options: CarouselOptions(height:250,autoPlay: true),
              items: [
                MyImageView("'assets/phone.png' "),
                 MyImageView("'assets/phone.png' "),
                  MyImageView("'assets/phone.png' "),
                   MyImageView("'assets/phone.png' "),
                   
              ]
          ),
        )
    );
  }
 
}
 
// ignore: must_be_immutable
class MyImageView extends StatelessWidget{
 
  String imgPath;
 
  MyImageView(this.imgPath);
 
  @override
  Widget build(BuildContext context) {
  
    return Container(
       margin: EdgeInsets.symmetric(horizontal: 5),
       child: FittedBox(
         fit: BoxFit.fill,
         child: Image.asset(imgPath,),
       )
    );
  }
 
}