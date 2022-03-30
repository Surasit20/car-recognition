import 'package:flutter/material.dart';
import 'package:flutter_application_1/Khowledge_car/khowledge_page.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  var titleList = [
    //หัวข้อทั้งหมด 9 ข้อ
    " วิธีการใช้งานแอปพลิเคชั่น ",
    " วิธีการเลือกรูปภาพที่นำมาใช้งานให้เหมาะสม ",
    
  ];

  // Description List Here      //คำอธิบายทั้ง 9 ข้อ
  var descList = [
    "1.ผู้ใช้งานเปิดใช้งานแอปพลิเคชั่นแล้ว เข้ามาสู่ยังหน้าแรก จะมีแถบด้านล่างให้ผู้ใช้ได้กดเลือกไปยังหน้าที่ผู้ใช้ต้องการไป\n2.หน้าแรก คือ ส่วนของการเลือกรูปภาพรถยนต์ จะมีปุ่มกดเลือกกล้องถ่ายภาพ และ ปุ่ม รูปภาพ เพื่อเลือกรูปภาพมาใช้ในการค้นหา โดยรูปภาพสามารถเลือกได้ทั้ง ด้านใดด้านนึง และ ทั้ง 2 ด้าน จากนั้นกดปุ่มค้นหารถยนต์เพื่อทำการประมวลผล และ มีปุ่มรูปถังขยะเพื่อทำการเคลียร์รูปภาพ\n3.หน้าสอง คือ หมวดหมู่ของการดูแลรักษารถยนต์สำหรับมือใหม่ทั้ง 9 ข้อ\n4.หน้าสาม คือ หมวดหมู่ของวิธีการใช้งานแอปพลิเคชั่น ",
    
    "1.รูปภาพด้านบน คือ ภาพมุมรถยนต์ตัวอย่างของการถ่ายภาพ และ เลือกรูปภาพที่ผู้ใช้นำมาใช้งาน\n2.ภาพที่นำมาประมวลผลต้องมีแสงสว่างที่เพียงพอ ไม่มีสิ่งต่าง ๆ มาบดบังตัวรถยนต์\n3.สภาพภายนอกรถยนต์ต้องไม่มีการเปลี่ยนแปลงจนไม่สามารถระบุรุ่นรถยนต์ตัวอย่างเช่น ต้องไม่มีการดัดแปลงเปลี่ยนชุดกันชนหน้าเป็นรถยนต์ประเภท Offroad",
  ];

  // Image Name List Here   // รายการรูปทั้งหมด 9 รูป
  var imgList = [
    'assets/logo app.png',
    'assets/examcar.png',
    
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


