import 'package:flutter/material.dart';
import 'package:flutter_application_1/Khowledge_car/khowledge_page.dart';

class Guidetakeimage extends StatefulWidget {
  @override
  _GuidetakeimageState createState() => _GuidetakeimageState();
}

class _GuidetakeimageState extends State<Guidetakeimage> {
  var titleList = [
    //หัวข้อทั้งหมด 9 ข้อ
    " วิธีการเลือกมุมรูปภาพทางด้านหน้ารถยนต์ ",
    " วิธีการเลือกมุมรูปภาพทางด้านหลังรถยนต์ ",
    " ข้อควรระวังของการเลือกภาพถ่าย",
    " ข้อควรระวังของการเลือกภาพถ่ายรถยนต์ที่มีการ\nดัดแปลงสภาพ",
  ];

  // Description List Here      //คำอธิบายทั้ง 9 ข้อ
  var descList = [
    "1.วิธีการถ่ายภาพ หรือ เลือกรูปภาพทางด้านหน้ารถยนต์ทางด้านหน้ารถยนต์นั้น ต้องเห็นรายละเอียดของรถยนต์รุ่นนั้นๆชัดเจน ตามตัวอย่างภาพตัวอย่าง ",
    "1.วิธีการถ่ายภาพ หรือ เลือกรูปภาพทางด้านหน้ารถยนต์ทางด้านหลังรถยนต์นั้น ต้องเห็นรายละเอียดของรถยนต์รุ่นนั้นๆชัดเจน ตามตัวอย่างภาพตัวอย่าง ",
    "1.ภาพตัวอย่างแรกคือการ มีสิ่งวัตถุบดบังรายละเอียดส่วนของทางด้านหน้ารถ\n2.ภาพตัวอย่างของภาพกลางคืน ดังนั้นภาพภ่ายต้องมีแสงสว่างเพียงพอ",
    "1.ข้อควรระวังของการเลือกภาพถ่ายรถยนต์ที่มีการดัดแปลงสภาพรถยนต์ให้ต่างจากสภาพเดิมโรงงาน ตัวอย่างเช่น การดัดแปลงสภาพรถยนต์เป็นประเภท รถยนต์ offroad"
  ];

  // Image Name List Here   // รายการรูปทั้งหมด 9 รูป
  var imgList = [
    'assets/examcarf.png',
    'assets/examcarb.png',
    'assets/!examcar.png',
    'assets/offroadexamcar.png'
    
  ];
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
     body: ListView.builder(
        itemCount: imgList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // This Will Call When User Click On ListView Item
              showDialogFunc(context, imgList[index], titleList[index],
                  descList[index]); //คลิกแล้วจะแสดงหน้าต่าง
            },
            // Card Which Holds Layout Of ListView Item
            child: Card(           //Layout ในรูปแบบของการ์ด
            
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Container(
                    //width: 100,
                    height: 100,
                   // child: Image.asset(imgList[index]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          titleList[index],
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black, //สีตัวหนังสือข้อ 1-9
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Chakra'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 50,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// This is a block of Model Dialog
showDialogFunc(context, img, title, desc) {
  //โชว์เนื้อหาที่ผู้ใช้กดเข้าไป

  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white, //พื้นหลังสีขาว box เนื้้อหา
            ),
            padding: EdgeInsets.all(15),
            height: 650, //ขนาดความสูง
            width: MediaQuery.of(context).size.width * 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  //กดเพื่อ clear รูปภาพ ข้อมูล

                  padding: const EdgeInsets.fromLTRB(300, 10, 0, 0),
                  child: Container(
                    height: 50.0,
                    width: 50.0,
                    child: FloatingActionButton(
                      //icon กดเคลียร์รูปภาพ
                      onPressed: () {
                        Navigator.pop(
                          context,
                          MaterialPageRoute(builder: (context) => Dashboard()),
                        );
                      },
                      backgroundColor: Colors.deepPurple[50],
                      child: Icon(
                        //Icons.clean_hands_outlined,
                        Icons.clear,
                        color: Colors.deepPurple,
                        size: 40,
                      ),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    //รูปภาพและขนาดของภาพ
                    img,
                    width: 600,
                    height: 200,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  title, //หัวข้อในส่วนเนื้อหา
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Chakra'),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  // width: 200,
                  child: Align(
                    //ส่วนของการจัดเนื้อหา
                    alignment: Alignment.center,
                    child: Text(
                      desc,
                      maxLines: 50,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Chakra'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}


