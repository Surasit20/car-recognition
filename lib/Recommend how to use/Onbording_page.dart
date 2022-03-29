import 'package:flutter/material.dart';
import 'package:flutter_application_1/Bottombar/home_page.dart';
// ignore: unused_import
import 'package:carousel_slider/carousel_slider.dart';
// ignore: unused_import
import 'package:flutter_application_1/intro_loading/SplashScreen.dart';
import 'package:introduction_screen/introduction_screen.dart';

// ignore: must_be_immutable
class OnBoardingPage extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final List<String> imageList = [
    'assets/logo1 car.png',
    'assets/logo1 car.png',
    'assets/logo1 car.png',
    'assets/logo1 car.png',
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            IntroductionScreen(
              pages: [
                PageViewModel(
                  title: 'App Car Recognition System Model 2021',
                  body: 'แอปพลิเคชั่นระบุรุ่นรถยนต์',
                  image: buildImage('assets/logo app.png'),
                  decoration: getPageDecoration(),
                ),
                PageViewModel(
                  title: '',
                  body: '',
                  image: buildImage('assets/logo1 car.png'),
                  decoration: getPageDecoration(),
                ),
                PageViewModel(
                  title: '',
                  body: '',
                  image: buildImage('assets/phone.png'),
                  decoration: getPageDecoration(),
                ),
                PageViewModel(
                  title: '',
                  body: '',
                  image: buildImage('assets/phone.png'),
                  decoration: getPageDecoration(),
                ),
                PageViewModel(
                  title: '',
                  body: '',
                  image: buildImage('assets/phone.png' ),
                  
                  decoration: getPageDecoration(),
                  
                ),
              
              ],
              done: Text('Get start',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.deepPurple.shade400)),
              onDone: () => goToHome(context),
              showSkipButton: true,
              skip: Text('Skip',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.deepPurple.shade400)),
              onSkip: () => goToHome(context),
              next:
                  Icon(Icons.arrow_forward, color: Colors.deepPurple.shade400),
              dotsDecorator: getDotDecoration(),
              onChange: (index) => print('Page $index selected'),
              //globalBackgroundColor: Theme.of(context).splashColor,
              skipFlex: 0,
              nextFlex: 0,
              // isProgressTap: false,
              // isProgress: false,
              // showNextButton: false,
              // freeze: true,
              // animationDuration: 1000,
            ),
          ],
        ),
      );

  void goToOnBoardingPage(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => OnBoardingPage()),
      );

  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => Home()),
      );

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  DotsDecorator getDotDecoration() => DotsDecorator(
        //ปุ่มกดเปลี่ยนหน้าตรงส่วน Bottom bar
        color: Colors.purple.shade300,
        activeColor: Colors.deepPurple.shade400,
        size: Size(10, 10),
        activeSize: Size(15, 20),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  PageDecoration getPageDecoration() => PageDecoration(
        //ส่วนตัวหนังสือของส่วนบนหัวข้อหลัก
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          fontFamily: 'FiraSans',
          color: Colors.deepPurple.shade900,
          shadows: [
            // Stroke รอบตัวหนังสือ
            Shadow(
                // bottomLeft
                offset: Offset(-1.3, -1.3),
                color: Colors.white),
            Shadow(
                // bottomRight
                offset: Offset(1.3, -1.3),
                color: Colors.white),
            Shadow(
                // topRight
                offset: Offset(1.3, 1.3),
                color: Colors.white),
            Shadow(
                // topLeft
                offset: Offset(-1.3, 1.3),
                color: Colors.white),
          ],
        ),
        bodyTextStyle: TextStyle(
            fontSize: 15,
            fontFamily: 'FiraSans',
            fontWeight: FontWeight.bold,
            color: Colors.black87), //ปรับแต่งตัวหนังสือตรงเนื้อหาส่วนด้านล่าง
        descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
        imagePadding: EdgeInsets.all(24),

        //pageColor: (Colors.deepPurple.shade100),
        boxDecoration: BoxDecoration(
          //ไล่ระดับสีพื้นหลัง
          gradient: LinearGradient(
            // backgroud

            begin: Alignment.topRight,
            end: Alignment.bottomLeft,

            stops: [0.1, 0.5, 0.8, 1.0],

            colors: [
              const Color(0xFFD1C4E9),
              Colors.deepPurple.shade200,
              Colors.deepPurple.shade100,
              Colors.white70,
            ],
          ),
        ),
      );
     
      
}
