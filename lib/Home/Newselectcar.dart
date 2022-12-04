import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Car_infomation/car_infomation.dart';
import 'package:flutter_application_1/sizes_helpers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Newpageselectcar extends StatefulWidget {
  @override
  NewpageselectcarState createState() => NewpageselectcarState();

  const Newpageselectcar({
    Key key,
  }) : super(key: key);
}

class NewpageselectcarState extends State {
  bool shouldPop = true;
  File imageURLF;
  File imageURLR;
  var result;
  var resulttwo;
  bool checktwophoto = true;
  String pathF;
  String pathR;
  final List<String> imagesList = [
    'assets/BG/BG1.jpg',
    'assets/BG/BG2.jpg',
    'assets/BG/BG3.jpg',
    'assets/BG/BG4.jpg',
    'assets/BG/BG5.jpg',
    'assets/BG/BG6.jpg',
  ];

  Future getImageFromCamera(bool camera) async {
    try {
      // ignore: deprecated_member_use
      final image = await ImagePicker().getImage(source: ImageSource.camera);
      camera
          ? setState(() {
              imageURLF = File(image.path);
              pathF = image.path;
            })
          : setState(() {
              imageURLR = File(image.path);
              pathR = image.path;
            });
    } catch (e) {
      print("Error getting image from camera");
    }
  }

  Future getImageFromGallery(bool camera) async {
    try {
      // ignore: deprecated_member_use
      final image = await ImagePicker().getImage(source: ImageSource.gallery);

      camera
          ? setState(() {
              imageURLF = File(image.path);
              pathF = image.path;
            })
          : setState(() {
              imageURLR = File(image.path);
              pathR = image.path;
            });
    } catch (e) {
      print("Error getting image from gallery");
    }
  }

  Future classifyImage() async {
    var output;
    var outputF;
    var outputR;
    // ignore: unused_local_variable
    String name;
    if (imageURLF == null && imageURLR == null) return output = "ไม่มีภาพ";
    await Tflite.loadModel(
        model: "assets/model.tflite", labels: "assets/labels.txt");

    // for font

    if (imageURLF != null && imageURLR == null) {
      output = await Tflite.runModelOnImage(
          path: pathF,
          imageMean: 0.0, // defaults to 117.0
          imageStd: 255.0, // defaults to 1.0
          numResults: 18, // defaults to 5
          threshold: 0.0, // defaults to 0.1
          asynch: true);
    }
    // for rear
    else if (imageURLF == null && imageURLR != null) {
      output = await Tflite.runModelOnImage(
          path: pathR,
          imageMean: 0.0, // defaults to 117.0
          imageStd: 255.0, // defaults to 1.0
          numResults: 18, // defaults to 5
          threshold: 0.0, // defaults to 0.1
          asynch: true);
    } else {
      outputF = await Tflite.runModelOnImage(
          path: pathF,
          imageMean: 0.0, // defaults to 117.0
          imageStd: 255.0, // defaults to 1.0
          numResults: 18, // defaults to 5
          threshold: 0.0, // defaults to 0.1
          asynch: true);
      outputR = await Tflite.runModelOnImage(
          path: pathR,
          imageMean: 0.0, // defaults to 117.0
          imageStd: 255.0, // defaults to 1.0
          numResults: 18, // defaults to 5
          threshold: 0.0, // defaults to 0.1
          asynch: true);

      if (outputF[0]["index"] == outputR[0]["index"]) {
        print("หน้า  ${outputF[0]["index"]}  หลัง  ${outputR[0]["index"]} ");
        setState(() {
          result = outputF;
        });
        return;
      } else {
        print("หน้า  ${outputF[0]["index"]}  หลัง  ${outputR[0]["index"]} ");
        print("ไม่ถูก");
        setState(() {
          checktwophoto = false;
          resulttwo = {
            "font": outputF[0]['label'],
            "rear": outputR[0]['label']
          };
        });

        return;
      }
    }

    setState(() {
      result = output;
    });
  }

  // clear cur photo
  clearState() {
    setState(() {
      imageURLF = null;
      imageURLR = null;
      result = null;
    });
  }

  // ignore: unused_field

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: displayHeight(context) + MediaQuery.of(context).padding.top,
            //-kToolbarHeight,
            width: displayWidth(context) * 1,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/BG/intro.png"),
                fit: BoxFit.cover,
              ),
            ),

            //margin: EdgeInsets.only(bottom: 2.5),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Stack(children: <Widget>[
                      /*Container(
                        height: 180,
                        //height: displayHeight(context) * 0.26,
                        width: displayWidth(context) * 1,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/BG/BG5.jpg"),
                            fit: BoxFit.cover,
                          ),
                          //color: Colors.deepPurple,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                      ),*/
                      Container(
                        height: 210,
                        width: double.infinity,
                        child: CarouselSlider(
                          options: CarouselOptions(
                            scrollDirection: Axis.vertical,
                            enlargeCenterPage: true,
                            autoPlay: true,
                          ),
                          items: imagesList
                              .map(
                                (item) => Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Card(
                                    margin: EdgeInsets.only(),
                                    elevation: 10.0,
                                    shadowColor: Colors.redAccent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                      ),
                                      child: Stack(
                                        children: <Widget>[
                                          Image.asset(
                                            item,
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      Container(
                          child: Column(children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 175, 0, 0),
                          child: Container(
                            width: displayWidth(context) * 1,
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 3),
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            height: 35,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 15),
                                  blurRadius: 50,
                                  color: Colors.deepOrangeAccent,
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  alignment: FractionalOffset.center,
                                  child: Text(
                                    'การทำนายเพื่อระบุรุ่นรถยนต์',
                                    style: TextStyle(
                                        color: Colors.deepPurple,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Chakra',
                                        fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Container(
                                      alignment: Alignment.center,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                                //width: 300,
                                                height: 180,
                                                width:
                                                    displayWidth(context) * 1,
                                                decoration: BoxDecoration(
                                                  color: Colors.deepPurple[100],
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      offset: Offset(5, 10),
                                                      blurRadius: 10,
                                                      color: Colors.deepPurple,
                                                    ),
                                                  ],
                                                ),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  0, 10, 0, 0),
                                                          child: Container(
                                                            alignment:
                                                                FractionalOffset
                                                                    .center,
                                                            child: Text(
                                                              "รูปภาพที่ 1",
                                                              style: TextStyle(
                                                                  fontSize: 20,
                                                                  color: Colors
                                                                      .deepPurple,
                                                                  fontFamily:
                                                                      'Chakra',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  0, 10, 0, 0),
                                                          child: Container(
                                                            alignment:
                                                                FractionalOffset
                                                                    .center,
                                                            child: Text(
                                                              "(ด้านหน้า เท่านั้น!!)",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          255,
                                                                          8,
                                                                          0),
                                                                  fontFamily:
                                                                      'Chakra',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        imageURLF == null
                                                            ? Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                        //Box ขนาดที่แสดงรูปภาพว่าง
                                                                        color: Colors
                                                                            .white,
                                                                        borderRadius:
                                                                            BorderRadius.circular(20)),
                                                                //height: 150,
                                                                //width: 250,
                                                                height: 125,
                                                                width: 130,
                                                              )
                                                            : ClipRRect(
                                                                //Box ขนาดที่แสดงรูปภาพรถยนต์
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child: Image.file(
                                                                    File(pathF),
                                                                    height: 125,
                                                                    width: 130,
                                                                    fit: BoxFit
                                                                        .cover),
                                                              ),
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  20, 0, 0, 0),
                                                          child: Column(
                                                            children: [
                                                              Container(
                                                                  child:
                                                                      FloatingActionButton(
                                                                //heroTag: 'getImageFromCamera',
                                                                heroTag: null,
                                                                onPressed: () =>
                                                                    getImageFromCamera(
                                                                        true),
                                                                backgroundColor:
                                                                    Colors
                                                                        .deepPurple,
                                                                child: Icon(
                                                                  //Icons.clean_hands_outlined,
                                                                  Icons
                                                                      .camera_alt_outlined,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 30,
                                                                ),
                                                              )),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Container(
                                                                child: Container(
                                                                    child: FloatingActionButton(
                                                                  //heroTag: 'getImageFromGallery',
                                                                  heroTag: null,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .deepPurple,
                                                                  child: Icon(
                                                                    //Icons.clean_hands_outlined,
                                                                    Icons.image,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 30,
                                                                  ),
                                                                  onPressed: () =>
                                                                      getImageFromGallery(
                                                                          true),
                                                                )),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )),
                                          ]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Container(
                                      alignment: Alignment.center,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            height: 180,
                                            width: displayWidth(context) * 1,
                                            decoration: BoxDecoration(
                                              color: Colors.deepPurple[100],
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              boxShadow: [
                                                BoxShadow(
                                                  offset: Offset(5, 10),
                                                  blurRadius: 10,
                                                  color: Colors.deepPurple,
                                                ),
                                              ],
                                            ),
                                            child: Column(children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 10, 0, 0),
                                                    child: Container(
                                                      alignment:
                                                          FractionalOffset
                                                              .center,
                                                      child: Text(
                                                        "รูปภาพที่ 2",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color: Colors
                                                                .deepPurple,
                                                            fontFamily:
                                                                'Chakra',
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 10, 0, 0),
                                                    child: Container(
                                                      alignment:
                                                          FractionalOffset
                                                              .center,
                                                      child: Text(
                                                        "(ด้านหลัง เท่านั้น!!)",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    255,
                                                                    8,
                                                                    0),
                                                            fontFamily:
                                                                'Chakra',
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  imageURLR == null
                                                      ? Container(
                                                          decoration:
                                                              BoxDecoration(
                                                                  //Box ขนาดที่แสดงรูปภาพรถยนต์
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20)),
                                                          //height: 150,
                                                          //width: 250,
                                                          height: 125,
                                                          width: 130,
                                                        )
                                                      : ClipRRect(
                                                          //Box ขนาดที่แสดงรูปภาพรถยนต์
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.file(
                                                              File(pathR),
                                                              height: 125,
                                                              width: 130,
                                                              fit:
                                                                  BoxFit.cover),
                                                        ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(20, 0, 0, 0),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                            child:
                                                                FloatingActionButton(
                                                          // heroTag: 'getImageFromCamera',
                                                          heroTag: null,
                                                          onPressed: () =>
                                                              getImageFromCamera(
                                                                  false),
                                                          backgroundColor:
                                                              Colors.deepPurple,
                                                          child: Icon(
                                                            //Icons.clean_hands_outlined,
                                                            Icons
                                                                .camera_alt_outlined,
                                                            color: Colors.white,
                                                            size: 30,
                                                          ),
                                                        )),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Container(
                                                          child: Container(
                                                              child:
                                                                  FloatingActionButton(
                                                            heroTag: null,
                                                            //heroTag: 'getImageFromGallery',
                                                            backgroundColor:
                                                                Colors
                                                                    .deepPurple,
                                                            child: Icon(
                                                              //Icons.clean_hands_outlined,
                                                              Icons.image,
                                                              color:
                                                                  Colors.white,
                                                              size: 30,
                                                            ),
                                                            onPressed: () =>
                                                                getImageFromGallery(
                                                                    false),
                                                          )),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ]),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                'กรุณาเลือกรูปภาพ',
                                style: TextStyle(
                                  color: Colors.deepPurple[800],
                                  fontSize: 18,
                                  fontFamily: 'Chakra',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Column(
                          //mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              //alignment: Alignment.bottomCenter,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 30),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(25),
                                    child: Stack(
                                      children: <Widget>[
                                        Positioned.fill(
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: <Color>[
                                                  Colors.deepPurple,
                                                  Colors.deepPurple,
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            padding: const EdgeInsets.all(13),
                                            primary: Colors.white,
                                            textStyle: const TextStyle(
                                              fontSize: 18,
                                              fontFamily: 'Chakra',
                                            ),
                                          ),
                                          onPressed: () async {
                                            //check 2 photo
                                            if (imageURLF != null &&
                                                imageURLR != null) {
                                              await classifyImage(); // predict car
                                              // if predict is ture
                                              if (checktwophoto) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Carinfomation(
                                                              namecar:
                                                                  "${result[0]['label']}",
                                                            )));
                                              } else {
                                                checktwophoto = true;
                                                //if predict is flase
                                                showDialog<String>(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) =>
                                                          AlertDialog(
                                                    title: const Text(
                                                      'ไม่สามารถระบุรุ่นรถยนต์ได้',
                                                      style: TextStyle(
                                                          fontFamily: 'Chakra',
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    content: Text(
                                                      'ผลจากการทำนายรถยนต์ด้านหน้าเป็นรถยนต์รุ่น ${resulttwo["font"]} แต่ผลการทำนายรูปด้านหลังเป็นรถยนต์เป็นรุ่น ${resulttwo["rear"]}',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context, 'ปิด'),
                                                        child: const Text('ปิด',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Chakra',
                                                                color:
                                                                    Colors.red,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }
                                              // select font or rear
                                            } else if ((imageURLF != null ||
                                                imageURLR != null)) {
                                              await classifyImage(); // predict car
                                              //send data car to next page for get detail car
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Carinfomation(
                                                            namecar:
                                                                "${result[0]['label']}",
                                                          )));
                                            }
                                            // emty data
                                            else {
                                              showDialog<String>(
                                                context: context,
                                                builder:
                                                    (BuildContext context) =>
                                                        AlertDialog(
                                                  title: const Text(
                                                      'ผู้ใช้ยังไม่ได้อัพโหลดรูปภาพ',
                                                      style: TextStyle(
                                                          fontFamily: 'Chakra',
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  content: const Text(
                                                      'กรุณาอัพโหลดรูปภาพเพื่อทำการทำนายรุ่นรถยนต์',
                                                      style: TextStyle(
                                                          fontFamily: 'Chakra',
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              context, 'ปิด'),
                                                      child: const Text('ปิด',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Chakra',
                                                              color: Colors.red,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }
                                          },
                                          child: const Text(
                                            'ค้นหารุ่นรถยนต์',
                                            style: TextStyle(
                                              fontFamily: 'Chakra',
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    //กดเพื่อ clear รูปภาพ ข้อมูล
                                    width: 50,
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      child: FloatingActionButton(
                                        //icon กดเคลียร์รูปภาพ
                                        //heroTag: 'ClearState',
                                        heroTag: null,
                                        onPressed: () => clearState(),
                                        backgroundColor: Colors.red,
                                        child: Icon(
                                          //Icons.clean_hands_outlined,
                                          Icons.delete_forever,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ]))
                    ]),
                  ),
                ],
              ),
            )));
  }
}
