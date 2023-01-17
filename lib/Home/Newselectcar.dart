import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Car_infomation/car_infomation.dart';
import 'package:flutter_application_1/sizes_helpers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:path_provider/path_provider.dart' as syspaths;

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
  XFile imageF;
  XFile imageR;
  var result;
  var resulttwo;
  bool checktwophoto = true;
  String pathF;
  String pathR;

  bool _isLoading = false;

  void _showDialog() {
    setState(() => _isLoading = false);
  }

  //เวลา loading //
  Future<void> _fetchBackEndData() async {
    // Any call to your asynchronous operation

    await Future.delayed(const Duration(seconds: 10));
  }

  final List<String> imagesList = [
    'assets/BG/BG1.jpg',
    'assets/BG/BG2.jpg',
    'assets/BG/BG3.jpg',
    'assets/BG/BG4.jpg',
    'assets/BG/BG5.jpg',
    'assets/BG/BG6.jpg',
  ];
  final ImagePicker _picker = ImagePicker();
  List<XFile> imagesf;
  List<XFile> imagesr;
  Future<void> testf() async {
    List<XFile> _images = await _picker.pickMultiImage();
    setState(() {
      imagesf = _images;
    });

    /*
   
    */
  }

  Future<void> testr() async {
    List<XFile> _images = await _picker.pickMultiImage();
    setState(() {
      imagesr = _images;
    });

    /*
   
    */
  }

  Future<String> test2(XFile images) async {
    //print(images.path);
    var decodedImage = await decodeImageFromList(await images.readAsBytes());

    int minSize = decodedImage.width > decodedImage.height
        ? decodedImage.height
        : decodedImage.width;

    int centerX = (decodedImage.width / 2).round();
    int centerY = (decodedImage.height / 2).round();

    int left = (centerX - (minSize / 2)).floor();
    int top = (centerY - (minSize / 2)).floor();
    /*
    print(left);
    print(top);
    print(decodedImage.width);
    print(decodedImage.height);
    print(centerX);
    print(centerY);
    */
    final image = await img.decodeImage(await File(images.path).readAsBytes());

    final cropImage = img.copyCrop(image, left, top, minSize, minSize);

    final width = cropImage.width;
    final higth = cropImage.height;

    final croppedResized = img.copyResize(
      cropImage,
      width: 400,
      interpolation: img.Interpolation.average,
    );
    final jpegBytes = img.encodeJpg(croppedResized, quality: 100);

    //  final croppedImageFile = await File(args.destPath).writeAsBytes(jpegBytes);
    // print(croppedResized.width);
    //  print(croppedResized.height);

    final appDir = await syspaths.getTemporaryDirectory();
    File file = File('${appDir.path}/temp.jpg');
    await file.writeAsBytes(jpegBytes);
    return file.path;
  }

////////////////////////////////////////////////////////////////////////
  Future<void> test1(List<XFile> images1, List<XFile> images2) async {
    var output1;
    var output2;

    List<String> res = [];
    for (var i = 0; i < images1.length; i++) {
      String path1 = await test2(images1[i]);
      await Tflite.loadModel(
          model: "assets/modelf.tflite", labels: "assets/labels.txt");
      output1 = await Tflite.runModelOnImage(
          path: path1,
          imageMean: 0.0, // defaults to 117.0
          imageStd: 255.0, // defaults to 1.0
          numResults: 18, // defaults to 5
          threshold: 0.0, // defaults to 0.1
          asynch: false);

      await Tflite.loadModel(
          model: "assets/modelr.tflite", labels: "assets/labels.txt");

      String path2 = await test2(images2[i]);
      output2 = await Tflite.runModelOnImage(
          path: path2,
          imageMean: 0.0, // defaults to 117.0
          imageStd: 255.0, // defaults to 1.0
          numResults: 18, // defaults to 5
          threshold: 0.0, // defaults to 0.1
          asynch: false);

      //print(output1[0]["label"]);
      //print(output2[0]["label"]);
      if (output1[0]["confidence"] > output2[0]["confidence"]) {
        res.add(output1[0]["label"]);
      } else {
        res.add(output2[0]["label"]);
      }
    }
    print("+++++++++++++++++++++++++++++++++++++++++++++++++++++");
    print(res);

    for (var k = 0; k < res.length; k++) {
      print(res[k] + "  " + k.toString());
    }

    await Tflite.close();
  }

  Future getImageFromCamera(bool camera) async {
    try {
      // ignore: deprecated_member_use
      //final XFile? image = await ImagePicker().getImage(source: ImageSource.camera);
      final XFile image =
          await ImagePicker().pickImage(source: ImageSource.camera);
      camera
          ? setState(() {
              imageURLF = File(image.path);
              pathF = image.path;
              imageF = image;
            })
          : setState(() {
              imageURLR = File(image.path);
              pathR = image.path;
              imageR = image;
            });
    } catch (e) {
      print("Error getting image from camera");
    }
  }

  Future getImageFromGallery(bool camera) async {
    try {
      // ignore: deprecated_member_use
      final XFile image =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      camera
          ? setState(() {
              imageURLF = File(image.path);
              pathF = image.path;
              imageF = image;
            })
          : setState(() {
              imageURLR = File(image.path);
              pathR = image.path;
              imageR = image;
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

    // for font
    if (imageURLF != null && imageURLR == null) {
      await Tflite.loadModel(
          model: "assets/modelf.tflite", labels: "assets/labels.txt");
      final urlF = await preImage(imageF);
      output = await Tflite.runModelOnImage(
          path: urlF,
          imageMean: 0.0, // defaults to 117.0
          imageStd: 255.0, // defaults to 1.0
          numResults: 18, // defaults to 5
          threshold: 0.0, // defaults to 0.1
          asynch: true);
    }
    // for rear
    else if (imageURLF == null && imageURLR != null) {
      final urlR = await preImage(imageR);
      await Tflite.loadModel(
          model: "assets/modelr.tflite", labels: "assets/labels.txt");
      output = await Tflite.runModelOnImage(
          path: urlR,
          imageMean: 0.0, // defaults to 117.0
          imageStd: 255.0, // defaults to 1.0
          numResults: 18, // defaults to 5
          threshold: 0.0, // defaults to 0.1
          asynch: true);
    } else {
      //for both
      final urlF = await preImage(imageF);
      final urlR = await preImage(imageR);
      await Tflite.loadModel(
          model: "assets/modelf.tflite", labels: "assets/labels.txt");
      outputF = await Tflite.runModelOnImage(
          path: urlF,
          imageMean: 0.0, // defaults to 117.0
          imageStd: 255.0, // defaults to 1.0
          numResults: 18, // defaults to 5
          threshold: 0.0, // defaults to 0.1
          asynch: true);

      await Tflite.loadModel(
          model: "assets/modelr.tflite", labels: "assets/labels.txt");
      outputR = await Tflite.runModelOnImage(
          path: urlR,
          imageMean: 0.0, // defaults to 117.0
          imageStd: 255.0, // defaults to 1.0
          numResults: 18, // defaults to 5
          threshold: 0.0, // defaults to 0.1
          asynch: true);

      if (outputF[0]["confidence"] > outputR[0]["confidence"]) {
        print(
            "หน้า  ${outputF[0]["confidence"]}  หลัง  ${outputR[0]["confidence"]} ");
        setState(() {
          result = outputF;
        });
        return;
      } else {
        setState(() {
          result = outputR;
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

  Future<String> preImage(XFile images) async {
    //print(images.path);
    var decodedImage = await decodeImageFromList(await images.readAsBytes());

    int minSize = decodedImage.width > decodedImage.height
        ? decodedImage.height
        : decodedImage.width;

    int centerX = (decodedImage.width / 2).round();
    int centerY = (decodedImage.height / 2).round();

    int left = (centerX - (minSize / 2)).floor();
    int top = (centerY - (minSize / 2)).floor();
    /*
    print(left);
    print(top);
    print(decodedImage.width);
    print(decodedImage.height);
    print(centerX);
    print(centerY);
    */
    final image = await img.decodeImage(await File(images.path).readAsBytes());

    final cropImage = img.copyCrop(image, left, top, minSize, minSize);

    final width = cropImage.width;
    final higth = cropImage.height;

    final croppedResized = img.copyResize(
      cropImage,
      width: 400,
      interpolation: img.Interpolation.average,
    );
    final jpegBytes = img.encodeJpg(croppedResized, quality: 100);

    //  final croppedImageFile = await File(args.destPath).writeAsBytes(jpegBytes);
    // print(croppedResized.width);
    //  print(croppedResized.height);

    final appDir = await syspaths.getTemporaryDirectory();
    File file = File('${appDir.path}/temp.jpg');
    await file.writeAsBytes(jpegBytes);
    return file.path;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
              height:
                  displayHeight(context) + MediaQuery.of(context).padding.top,
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
                          width: displayWidth(context),
                          child: CarouselSlider(
                            options: CarouselOptions(
                              scrollDirection: Axis.horizontal,
                              enlargeCenterPage: true,
                              viewportFraction: 1,
                              autoPlay: true,
                            ),
                            items: imagesList
                                .map(
                                  (item) => Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: Card(
                                      margin: EdgeInsets.only(),
                                      elevation: 0.0,
                                      shadowColor: Colors.redAccent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
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
                                              width: displayWidth(context),
                                              height: displayHeight(context),
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
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 10, 0, 0),
                                      child: Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                  //width: 300,
                                                  height: 200,
                                                  width:
                                                      displayWidth(context) * 1,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        Colors.deepPurple[100],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        offset: Offset(5, 10),
                                                        blurRadius: 10,
                                                        color:
                                                            Colors.deepPurple,
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
                                                                    0,
                                                                    10,
                                                                    0,
                                                                    0),
                                                            child: Container(
                                                              alignment:
                                                                  FractionalOffset
                                                                      .center,
                                                              child: Text(
                                                                "รูปภาพที่ 1",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20,
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
                                                                    0,
                                                                    10,
                                                                    0,
                                                                    0),
                                                            child: Container(
                                                              alignment:
                                                                  FractionalOffset
                                                                      .center,
                                                              child: Text(
                                                                "(ด้านหน้า เท่านั้น!!)",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16,
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
                                                      SizedBox(
                                                        height: 5,
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
                                                                  height: 150,
                                                                  width: 170,
                                                                )
                                                              : ClipRRect(
                                                                  //Box ขนาดที่แสดงรูปภาพรถยนต์
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child: Image.file(
                                                                      File(
                                                                          pathF),
                                                                      height:
                                                                          150,
                                                                      width:
                                                                          170,
                                                                      fit: BoxFit
                                                                          .cover),
                                                                ),
                                                          Padding(
                                                            padding: EdgeInsets
                                                                .fromLTRB(20, 0,
                                                                    0, 0),
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
                                                                  child:
                                                                      Container(
                                                                          child:
                                                                              FloatingActionButton(
                                                                    //heroTag: 'getImageFromGallery',
                                                                    heroTag:
                                                                        null,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .deepPurple,
                                                                    child: Icon(
                                                                      //Icons.clean_hands_outlined,
                                                                      Icons
                                                                          .image,
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
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 10, 0, 0),
                                      child: Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              height: 200,
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
                                                              .fromLTRB(
                                                          0, 10, 0, 0),
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
                                                              .fromLTRB(
                                                          0, 10, 0, 0),
                                                      child: Container(
                                                        alignment:
                                                            FractionalOffset
                                                                .center,
                                                        child: Text(
                                                          "(ด้านหลัง เท่านั้น!!)",
                                                          style: TextStyle(
                                                              fontSize: 16,
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
                                                SizedBox(
                                                  height: 5,
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
                                                                        BorderRadius.circular(
                                                                            20)),
                                                            //height: 150,
                                                            //width: 250,
                                                            height: 150,
                                                            width: 170,
                                                          )
                                                        : ClipRRect(
                                                            //Box ขนาดที่แสดงรูปภาพรถยนต์
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child: Image.file(
                                                                File(pathR),
                                                                height: 150,
                                                                width: 170,
                                                                fit: BoxFit
                                                                    .cover),
                                                          ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          20, 0, 0, 0),
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
                                                                Colors
                                                                    .deepPurple,
                                                            child: Icon(
                                                              //Icons.clean_hands_outlined,
                                                              Icons
                                                                  .camera_alt_outlined,
                                                              color:
                                                                  Colors.white,
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
                                                                color: Colors
                                                                    .white,
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
                                /*child: Text(
                                  'กรุณาเลือกรูปภาพ',
                                  style: TextStyle(
                                    color: Colors.deepPurple[800],
                                    fontSize: 18,
                                    fontFamily: 'Chakra',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),*/
                              ),
                              Stack(
                                children: <Widget>[
                                  // Stroked text as border.
                                  Text(
                                    'กรุณาเลือกรูปภาพ',
                                    style: TextStyle(
                                      fontSize: 25,
                                      foreground: Paint()
                                        ..style = PaintingStyle.stroke
                                        ..strokeWidth = 5
                                        ..color = Colors.deepPurple[800],
                                    ),
                                  ),
                                  // Solid text as fill.
                                  Text(
                                    'กรุณาเลือกรูปภาพ',
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.grey[300],
                                    ),
                                  ),
                                ],
                              )
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
                                          /*TextButton(
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
                                          ),*/
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
                                              if (imageURLF != null &&
                                                  imageURLR != null) {
                                                setState(
                                                    () => _isLoading = true);

                                                await classifyImage().then((_) =>
                                                    _showDialog()); // predict car

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
                                                    builder: (BuildContext
                                                            context) =>
                                                        AlertDialog(
                                                      title: const Text(
                                                        'ไม่สามารถระบุรุ่นรถยนต์ได้',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Chakra',
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
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
                                                                  context,
                                                                  'ปิด'),
                                                          child: const Text(
                                                              'ปิด',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'Chakra',
                                                                  color: Colors
                                                                      .red,
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
                                                setState(
                                                    () => _isLoading = true);

                                                await classifyImage().then((_) =>
                                                    _showDialog()); // predict car
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
                                                            fontFamily:
                                                                'Chakra',
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    content: const Text(
                                                        'กรุณาอัพโหลดรูปภาพเพื่อทำการทำนายรุ่นรถยนต์',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Chakra',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600)),
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
                                            },
                                            child: _isLoading
                                                ? Container(
                                                    width: 130,
                                                    height: 29,
                                                    child:
                                                        const LoadingIndicator(
                                                            indicatorType: Indicator
                                                                .ballRotateChase,

                                                            /// Required, The loading type of the widget
                                                            colors: const [
                                                              Colors.red,
                                                              Colors.orange,
                                                              Colors.yellow,
                                                              Colors.green,
                                                              Colors.blue,
                                                              Colors.indigo,
                                                              Colors.purple,
                                                            ],

                                                            /// Optional, The color collections
                                                            strokeWidth: 10,

                                                            /// Optional, The stroke of the line, only applicable to widget which contains line
                                                            backgroundColor:
                                                                Colors
                                                                    .deepPurple,

                                                            /// Optional, Background of the widget
                                                            pathBackgroundColor:
                                                                Colors
                                                                    .deepPurple

                                                            /// Optional, the stroke backgroundColor
                                                            ),
                                                  )
                                                : const Text(
                                                    'ค้นหารุ่นรถยนต์',
                                                    style: TextStyle(
                                                      fontFamily: 'Chakra',
                                                      fontWeight:
                                                          FontWeight.w800,
                                                    ),
                                                  ),
                                          )
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
                                    TextButton(
                                      onPressed: () => test1(imagesf, imagesr),
                                      child: Text("ทดสอบ"),
                                    ),
                                    TextButton(
                                      onPressed: () => testf(),
                                      child: Text("รูปf"),
                                    ),
                                    TextButton(
                                      onPressed: () => testr(),
                                      child: Text("รูปr"),
                                    )
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
              ))),
    );
  }
}
