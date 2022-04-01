import 'package:flutter/material.dart';
import 'package:flutter_application_1/Khowledge_car/khowledge_page.dart';

class Datauseapp2 extends StatefulWidget {
  @override
  _Datauseapp2State createState() => _Datauseapp2State();
}

class _Datauseapp2State extends State<Datauseapp2> {
  var titleList = [
    //หัวข้อทั้งหมด 9 ข้อ
    " วิธีที่ 1 : วิธีการใช้งานหน้าการดูแลรักษารถยนต์สำหรับ\nมือใหม่ 9 ข้อ ",
    " วิธีที่ 2 : วิธีการดูข้อมูลหรือเนื้อหา ",
    
  ];

  // Description List Here      //คำอธิบายทั้ง 9 ข้อ
  var descList = [
    "1.ผู้ใช้งานที่อยู่ในหน้าของการทำนายรถยนต์ที่ต้องการไปยังหน้าวิธีการดูแลรักษารถยนต์ ให้ผู้ใช้งานกดไปยังที่ปุ่มตามรูปลูกศรชี้\n2.จากนั้นจะแสดงวิธีการใช้งานหน้าการดูแลรักษารถยนต์สำหรับมือใหม่ 9 ข้อ ",
    
    "1.หลังจากที่ผู้ใช้งานมายังหน้าวิธีการดูแลรักษารถยนต์แล้วให้ผู้ใช้กดไปยังข้อที่ต้องการศึกษาดังตัวอย่างลูกศรสีแดง\n2.จะแสดงเนื้อตามหัวข้อ ผู้ใช้ที่ต้องการจะอ่านข้อถัดไปให้กดไปยังที่ปุ่มกากบาทตามลูกศรสีเขียว",
  ];

  // Image Name List Here   // รายการรูปทั้งหมด 9 รูป
  var imgList = [
    'assets/use5.png',
    'assets/use6.png',
    
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
                  height: 10,
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


