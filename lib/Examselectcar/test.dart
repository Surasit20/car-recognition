import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{
   final List<String> imageList = [
   'assets/o1.png',
    'assets/o2.jpg',
    'assets/o3.jpg',
    'assets/o4.jpg',
    'assets/o5.jpg',
   ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(" Image Slider App ") ,
        ),
        body: Center(
          child: CarouselSlider(
            options: CarouselOptions(
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              autoPlay: true,
            ),
            items: imageList.map((e) => ClipRRect(
             borderRadius: BorderRadius.circular(8),
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.asset(e,
                  width: 1050,
                  height: 350,
                  fit: BoxFit.cover,)
                ],
              ) ,
            )).toList(),
          ),
        ),
      ),
    );
  }
}