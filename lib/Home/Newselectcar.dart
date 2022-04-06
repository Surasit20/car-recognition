import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Car_infomation/car_infomation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class Newpageselectcar extends StatefulWidget {
  @override
  NewpageselectcarState createState() => NewpageselectcarState();

  const Newpageselectcar({
    Key key,
  }) : super(key: key);
}

class NewpageselectcarState extends State {
  bool shouldPop = true;
  XFile imageURLF;
  XFile imageURLR;
  var result;
  var resulttwo;
  bool checktwophoto = true;
  String pathF;
  String pathR;
  Future getImageFromCamera(bool camera) async {
    try {
      XFile image = await ImagePicker().pickImage(source: ImageSource.camera);
      camera
          ? setState(() {
              imageURLF = image;
              pathF = image.path;
            })
          : setState(() {
              imageURLR = image;
              pathR = image.path;
            });
    } catch (e) {
      print("Error getting image from camera");
    }
  }

  Future getImageFromGallery(bool camera) async {
    try {
      var image = await ImagePicker().pickImage(source: ImageSource.gallery);

      camera
          ? setState(() {
              imageURLF = image;
              pathF = image.path;
            })
          : setState(() {
              imageURLR = image;
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
  int _current = 0;
  List imgList = [
    'assets/11.jpg',
    'assets/12.jpg',
    'assets/13.jpg',
  ];
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        /*decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple[400], Colors.deepPurple[200]],
            stops: [0.2, 1.0],
          ),
        ),*/
        margin: EdgeInsets.only(bottom: 2.5),
        child: Stack(children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: 10,
              right: 0,
              bottom: 36,
            ),
            height: 210,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/BG1.jpg"),
                fit: BoxFit.cover,
              ),
              //color: Colors.deepPurple,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Container(
              //height: 50,
              alignment: FractionalOffset.topLeft,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                child: Container(
                  // color: Colors.black,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'ยินดีต้อนรับ',
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Chakra',
                            fontSize: 25),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 460,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 50),
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 5),
                    blurRadius: 50,
                    color: Colors.deepOrange,
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
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            //กดเพื่อ clear รูปภาพ ข้อมูล
            padding: const EdgeInsets.fromLTRB(350, 245, 0, 0),
            child: Container(
              height: 40,
              width: 40,
              child: FloatingActionButton(
                //icon กดเคลียร์รูปภาพ
                onPressed: () => clearState(),
                backgroundColor: Colors.deepPurple[50],
                child: Icon(
                  //Icons.clean_hands_outlined,
                  Icons.delete_forever,
                  color: Colors.deepPurple,
                  size: 30,
                ),
              ),
            ),
          ),
          Container(
              child: Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.fromLTRB(0, 220, 0, 0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          width: 300,
                          height: 170,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple[300],
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 5),
                                blurRadius: 1,
                                color: Colors.deepPurple[400],
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                alignment: FractionalOffset.center,
                                child: Text(
                                  "ด้านหน้า",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontFamily: 'Chakra',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Row(
                                children: [
                                  imageURLF == null
                                      ? Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(50, 0, 0, 0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                //Box ขนาดที่แสดงรูปภาพรถยนต์
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            //height: 150,
                                            //width: 250,
                                            height: 100,
                                            width: 100,
                                          ),
                                        )
                                      : Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(50, 0, 0, 0),
                                          child: ClipRRect(
                                            //Box ขนาดที่แสดงรูปภาพรถยนต์
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.file(File(pathF),
                                                height: 100,
                                                width: 100,
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Container(
                                            child: FloatingActionButton(
                                          onPressed: () =>
                                              getImageFromCamera(true),
                                          backgroundColor:
                                              Colors.deepPurple[50],
                                          child: Icon(
                                            //Icons.clean_hands_outlined,
                                            Icons.camera_alt_outlined,
                                            color: Colors.deepPurple,
                                            size: 30,
                                          ),
                                        )),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          child: Container(
                                              child: FloatingActionButton(
                                            backgroundColor:
                                                Colors.deepPurple[50],
                                            child: Icon(
                                              //Icons.clean_hands_outlined,
                                              Icons.image,
                                              color: Colors.deepPurple,
                                              size: 30,
                                            ),
                                            onPressed: () =>
                                                getImageFromGallery(true),
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
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 300,
                      height: 170,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple[300],
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 5),
                            blurRadius: 1,
                            color: Colors.deepPurple[400],
                          ),
                        ],
                      ),
                      child: Column(children: [
                        Container(
                          alignment: FractionalOffset.center,
                          child: Text(
                            "ด้านหลัง",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontFamily: 'Chakra',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                       Row(
                                children: [
                                  imageURLF == null
                                      ? Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(50, 0, 0, 0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                //Box ขนาดที่แสดงรูปภาพรถยนต์
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            //height: 150,
                                            //width: 250,
                                            height: 100,
                                            width: 100,
                                          ),
                                        )
                                      : Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(50, 0, 0, 0),
                                          child: ClipRRect(
                                            //Box ขนาดที่แสดงรูปภาพรถยนต์
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.file(File(pathR),
                                                height: 100,
                                                width: 100,
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Container(
                                            child: FloatingActionButton(
                                          onPressed: () =>
                                              getImageFromCamera(false),
                                          backgroundColor:
                                              Colors.deepPurple[50],
                                          child: Icon(
                                            //Icons.clean_hands_outlined,
                                            Icons.camera_alt_outlined,
                                            color: Colors.deepPurple,
                                            size: 30,
                                          ),
                                        )),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          child: Container(
                                              child: FloatingActionButton(
                                            backgroundColor:
                                                Colors.deepPurple[50],
                                            child: Icon(
                                              //Icons.clean_hands_outlined,
                                              Icons.image,
                                              color: Colors.deepPurple,
                                              size: 30,
                                            ),
                                            onPressed: () =>
                                                getImageFromGallery(false),
                                          )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                      ]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'กรุณาเลือกรูปภาพ',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 18,
                        fontFamily: 'Chakra',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                      height: 5,
                    ),
                    Container(
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
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            title: const Text(
                                                'ไม่สามารถระบุรุ่นรถยนต์ได้'),
                                            content: Text(
                                                'ผลจากการทำนายรถยนต์ด้านหน้าเป็นรถยนต์รุ่น ${resulttwo["font"]} แต่ทำนายรูปด้านหลังเป็นรถยนต์เป็นรุ่น ${resulttwo["rear"]}'),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    context, 'ปิด'),
                                                child: const Text('ปิด'),
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
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                          title: const Text(
                                              'ผู้ใช้ยังไม่ได้อัพโหลดรูปภาพ',
                                              style: TextStyle(
                                                  fontFamily: 'Chakra',
                                                  fontWeight: FontWeight.bold)),
                                          content: const Text(
                                              'กรุณาอัพโหลดรูปภาพเพื่อทำการทำนายรุ่นรถยนต์',
                                              style: TextStyle(
                                                  fontFamily: 'Chakra',
                                                  fontWeight: FontWeight.w600)),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context, 'ปิด'),
                                              child: const Text('ปิด',
                                                  style: TextStyle(
                                                      fontFamily: 'Chakra',
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.bold)),
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
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ]))
        ]));
  }
}
