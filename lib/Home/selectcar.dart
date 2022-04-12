/*import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Car_infomation/car_infomation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';


class Selectcar extends StatefulWidget {
  @override
  SelectcarState createState() => SelectcarState();
}

class SelectcarState extends State {
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'เลือกรถยนต์',
              style: TextStyle(fontFamily: 'Chakra'),
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
         // backgroundColor: Colors.deepPurple[400],
          body: Container(
            decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple[400], Colors.deepPurple[200]],
              stops: [0.2, 1.0],
            ),
          ),
            child: Column(children: [
              Padding(
                //กดเพื่อ clear รูปภาพ ข้อมูล

                padding: const EdgeInsets.fromLTRB(320, 10, 0, 0),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      imageURLF == null
                          ? Padding(
                              padding: const EdgeInsets.all(0),
                              child: Container(
                                decoration: BoxDecoration(
                                    //Box ขนาดที่แสดงรูปภาพรถยนต์
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                //height: 150,
                                //width: 250,
                                height: 170,
                                width: 250,
                              ),
                            )
                          : ClipRRect(
                              //Box ขนาดที่แสดงรูปภาพรถยนต์
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.file(File(pathF),
                                  height: 170, width: 250, fit: BoxFit.cover),
                            ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "ด้านหน้า",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: 'Chakra',
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: IconButton(
                                onPressed: () => getImageFromCamera(true),
                                icon: Icon(
                                  Icons.camera_alt_rounded,
                                  color: Colors.white,
                                ),
                                iconSize: 30,
                                color: Colors.blue,
                                padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                              )),
                          Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: IconButton(
                                icon: Icon(Icons.image, color: Colors.white),
                                iconSize: 30,
                                onPressed: () => getImageFromGallery(true),
                                color: Colors.blue,
                                padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                              )),
                        ],
                      ),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      imageURLR == null
                          ? Padding(
                              padding: const EdgeInsets.all(0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                height: 170,
                                width: 250,
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.file(File(pathR),
                                  height: 170, width: 250, fit: BoxFit.cover),
                            ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "ด้านหลัง",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: 'Chakra',
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: IconButton(
                                onPressed: () => getImageFromCamera(false),
                                icon: Icon(
                                  Icons.camera_alt_rounded,
                                  color: Colors.white,
                                ),
                                iconSize: 30,
                                color: Colors.blue,
                                padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                              )),
                          Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: IconButton(
                                icon: Icon(Icons.image, color: Colors.white),
                                iconSize: 30,
                                onPressed: () => getImageFromGallery(false),
                                color: Colors.blue,
                                padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                              )),
                        ],
                      ),
                    ]),
              ),
              Text(
                'กรุณาเลือกรูปภาพ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Chakra',
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
                                    Color(0xFFFFFFFD),
                                    Colors.white,
                                  ],
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(13),
                              primary: Colors.deepPurple,
                              textStyle: const TextStyle(
                                fontSize: 18,
                                fontFamily: 'Chakra',
                              ),
                            ),
                            onPressed: () async {
                              //check 2 photo
                              if (imageURLF != null && imageURLR != null) {
                                await classifyImage(); // predict car
                                // if predict is ture
                                if (checktwophoto) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Carinfomation(
                                                namecar: "${result[0]['label']}",
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
                                          onPressed: () =>
                                              Navigator.pop(context, 'ปิด'),
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
                                        builder: (context) => Carinfomation(
                                              namecar: "${result[0]['label']}",
                                            )));
                              }
                              // emty data
                              else {
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) => AlertDialog(
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
                                                fontWeight: FontWeight.bold)),
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
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ]),
          ),
        ));
  }
}*/
