import 'package:flutter/material.dart';
import 'package:flutter_application_1/Khowledge_car/khowledge_page.dart';

class Datauseapp3 extends StatefulWidget {
  @override
  _Datauseapp3State createState() => _Datauseapp3State();
}

class _Datauseapp3State extends State<Datauseapp3> {
  var titleList = [
    //หัวข้อทั้งหมด 9 ข้อ
    " วิธีที่ 1 : วิธีการใช้งานหน้าวิธีการใช้งานแอปพลิเคชั่น",
    " วิธีที่ 2 : วิธีการใช้งานแอปพลิเคชั่น",
    " วิธีที่ 3 : วิธีการเลือกรูปภาพมาทำนายให้เหมาะสม",
     " \t\t\t\t\t\tวิธีที่ 3.1 : ขั้นตอนต่อจากการเลือกหัวข้อต่างๆ",
  ];

  // Description List Here      //คำอธิบายทั้ง 9 ข้อ
  var descList = [
    "1.ผู้ใช้งานที่ต้องการทราบเกี่ยวกับวิธีการใช้งานของแอปพลิเคชั่นให้ทำการกดมายังตามลูกศรสีแดง จากนั้นจะเข้ามายังหน้าของวิธีการใช้งานแอปพลิเคชั่น\n2.โดยมีทั้งหมด 2 หัวข้อ \n1)วิธีการใช้งานแอปพลิเคชั่น ดูวิธีการใช้งานได้ที่วิธีที่ 2 \n2)วิธีการเลือกรูปภาพมาทำนายให้เหมาะสม ดูวิธีการใช้งานได้ที่วิธีที่ 3 ",
  
    "1.ผู้ใช้งานกดเข้ามายังวิธีการใช้งานแอปพลิเคชั่น จากนั้นจะเจอหัวข้อวิธีการใช้งานของทั้ง 3 หน้า ตัวอย่างผู้ใช้งานได้ทำการกดไปยังที่หัวข้อแรก วิธีการใช้งานหน้าทำนายรุ่นรถยนต์ จากนั้นจะแสดงหน้าต่างวิธีการใช้งานของหน้าทำนายรุ่นรถยนต์",
    "1.ผู้ใช้งานมายังหน้าแรกของวิธีการใช้งาน จากนั้นจะเจอหัวข้อที่สองชื่อว่า วิธีการเลือกรูปมาใช้งานให้เหมาะสมจากนั้นทำการกดเข้าไปตามตามลูกศรสีแดง\n2.จากนั้นจะแสดงหัวข้อต่างๆของการเลือกรูปภาพมาทำนายให้เหมาะสม ดูตัวอย่างได้ที่วิธี 3.1",
    "1.ตัวอย่างเช่น ผู้ใช้งานต้องการดูวิธีการเลือกมุมรูปภาพทางด้านหน้ารถยนต์ ผู้ใช้ทำการกดเข้าไปตามดังลูกศรสีแดง \n2.ผู้ใช้งานต้องการดูวิธีการอื่นๆ ให้ผู้ใช้งานทำการกดไปยังที่กากบาทตามลูกศรสีเขียว เพื่อออกไปยังหน้าหัวข้อ"
  ];

  // Image Name List Here   // รายการรูปทั้งหมด 9 รูป
  var imgList = [
    'assets/use7.png',
    'assets/use8.png',
    'assets/use10.png',
    'assets/use11.png',
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


