import 'package:flutter/material.dart';
import 'package:flutter_application_1/Khowledge_car/khowledge_page.dart';

class Datauseapp extends StatefulWidget {
  @override
  _DatauseappState createState() => _DatauseappState();
}

class _DatauseappState extends State<Datauseapp> {
  var titleList = [
    //หัวข้อทั้งหมด 9 ข้อ
    " วิธีที่ 1 : วิธีการเลือกรูปภาพจากแกลอรี่",
    " \t\t\t\t\t\tวิธีที่ 1.1 : ขั้นตอนต่อจากการเลือกรูปภาพจากแกลอรี่",
    " วิธีที่ 2 : วิธีการใช้งานกล้องถ่ายรูป",
    " \t\t\t\t\t\tวิธีที่ 2.1 : ขั้นตอนต่อจากการถ่ายภาพ",
    " วิธีที่ 3 : การเคลียร์ข้อมูลเพื่อทำนายรุ่นรถยนต์คันถัดไป"
  ];

  // Description List Here      //คำอธิบายทั้ง 9 ข้อ
  var descList = [
    "1.ผู้ใช้งานกดไปยังที่ปุ่มรูปภาพ ตามด้านที่ผู้ใช้ต้องการ\n 2.จากนั้นจะขึ้นหน้าต่างแกลอรี่เพื่อทำการเลือกรูปภาพรถยนต์ หลังจากการเลือกรูปภาพเสร็จดูต่อได้ที่วิธี 1.1",
    "1.หลังจากที่ผู้ใช้งานกดเลือกรูปทั้ง 2 ด้านแล้ว ให้ผู้ใช้มากดยังที่ปุ่ม 'ค้นหารุ่นรถยนต์'\n 2.จากนั้นเมื่อแอปพลิเคชั่นทำการประมวลเสร็จเรียบร้อย จะแสดงชื่อรุ่นรถยนต์ ค่าความถูกต้อง และ รุ่นย่อยของรถยนต์รุ่นนั้นๆ ",
    "1.ผู้ใช้งานกดไปยังที่ปุ่มกล้องถ่ายภาพ ตามด้านที่ผู้ใช้ต้องการ\n 2.จากนั้นจะขึ้นหน้าต่างกล้องถ่ายภาพตามมือถือของผู้ใช้งานจากนั้นกดถ่ายภาพ หลังจากการถ่ายรูปภาพเสร็จดูต่อได้ที่วิธี 2.1",
    "1.หลังจากที่ผู้ใช้งานถ่ายภาพเสร็จเรียบร้อยทั้ง 2 ด้านแล้ว ให้ผู้ใช้มากดยังที่ปุ่ม 'ค้นหารุ่นรถยนต์'\n 2.จากนั้นเมื่อแอปพลิเคชั่นทำการประมวลเสร็จเรียบร้อย จะแสดงชื่อรุ่นรถยนต์ ค่าความถูกต้อง และ รุ่นย่อยของรถยนต์รุ่นนั้นๆ ",
    "1.หลังจากที่ใช้งานต้องการที่จะทำการทำนายรถยนต์คันถัดไป ให้ทำการกดมาที่ปุ่มรูปถังขยะ เพื่อทำการเคลียร์ข้อมูล\n2.จากนั้นรูปภาพจะหายไป ผู้ใช้งานสามารถใช้งานเพื่อทำการทำนายรถยนต์คันถัดไป",
  ];

  // Image Name List Here   // รายการรูปทั้งหมด 9 รูป
  var imgList = [
    'assets/use1.png',
    'assets/use2.png',
    'assets/use3.png',
    'assets/use2.png',
    'assets/use4.png',
    
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
                    width: 1050,
                    height: 350,
                    fit: BoxFit.fill,
                  ),
                ),
                 SizedBox(
                  height: 20,
                ),
                Text(
                  title, //หัวข้อในส่วนเนื้อหา
                  style: TextStyle(
                      fontSize: 18,
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
                          fontSize: 15,
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


