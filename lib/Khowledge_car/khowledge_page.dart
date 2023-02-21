import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/sizes_helpers.dart';

// ignore: camel_case_types
class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

// ignore: camel_case_types
class _DashboardState extends State<Dashboard> {
  var titleList = [
    //หัวข้อทั้งหมด 9 ข้อ
    " ข้อที่ 1 การกรองอากาศ ",
    " ข้อที่ 2 ยางรถยนต์ ",
    " ข้อที่ 3 แบตเตอรี่ ",
    " ข้อที่ 4 ของเหลวในเครื่องยนต์ ",
    " ข้อที่ 5 สายพาน",
    " ข้อที่ 6 หัวเทียน",
    " ข้อที่ 7 ระบบห้ามล้อรถยนต์",
    " ข้อที่ 8 กระจกรถยนต์ ",
    " ข้อที่ 9 น้ำมันเกียร์อัตโนมัติ",
  ];

  // Description List Here      //คำอธิบายทั้ง 9 ข้อ
  var descList = [
    "กรองอากาศ ทำหน้าที่ในการดักจับฝุ่นละออง กรองฝุ่นและสิ่งสกปรกต่าง ๆ ไม่ให้เข้าไปยังเครื่องยนต์  โดยเครื่องกรองอากาศควรมีการล้างและทำความสะอาดหรือเปลี่ยนทุก ๆ 20,000 กิโลเมตรหรือถ้าหากคุณอยู่ในพื้นที่ที่มีฝุ่นเยอะ ควรที่จะเปลี่ยนทุก ๆ ระยะ 10,000 กิโลเมตร\n\nที่มา: AUTOSPINN",
    "สำหรับการเช็คลมยางซึ่งยางรถยนต์ มีหน้าที่ในการรับน้ำหนักของตัวรถทั้งคัน ที่ถ้าหากไม่ได้มีการตรวจสอบอย่างสม่ำเสมอก็อาจจะส่งผลให้เกิดปัญหาด้านการขับขี่ การเติมลมถ้าเป็นรถเก๋งส่วนใหญ่อยู่ที่ประมาณ 30–32 ปอนด์ต่อตารางนิ้ว (PSI) , ส่วนรถกระบะหากไม่มีสิ่งของที่ต้องบรรทุกควรมีแรงดันอยู่ที่ 36-38 PSI และล้อหลังอยู่ที่ 40-42 PSI แต่หากรถบรรทุกของหนักให้เพิ่มลมยางล้อหลังขึ้นเป็น 49-51 PSI เพื่อป้องกันยางระเบิด \n\nที่มา: CARS24",
    "ทำความสะอาดสายไฟ ทั้งบวกลบ และแบตเตอรี่ด้วยน้ำอุ่น และเช็ดให้แห้งอยู่เสมอตรวจเช็คทำความสะอาดขั้วแบตเตอรี่ และทาด้วยวาสลิน เพื่อป้องกับคราบขี้เกลือตรวจเช็คน้ำกลั่นสม่ำเสมอ ไม่ปล่อยให้น้ำแห้งไม่เติมน้ำกลั่นให้เกินกว่าขีดสูงสุด และต่ำกว่าขีดต่ำสุด\n\nที่มา: DB Battery",
    "น้ำมันเครื่อง มีหน้าที่ช่วยในการหล่อลื่นชิ้นส่วนต่าง ๆ ที่อยู่ภายในเครื่องยนต์ เพื่อป้องกันชิ้นส่วนต่างๆ นั้นเสียดสีกันโดยเฉพาะอย่างยิ่งเวลาสตาร์ตรถ อีกทั้งยังช่วยในการลดความร้อนที่เกิดขึ้น และป้องกันการเกิดสนิม การกัดกร่อน คราบเขม่า ได้อีกด้วย การเปลี่ยนน้ำมันเครื่องนั้นส่วนใหญ่จะนิยมเปลี่ยนกันเมื่อรถวิ่งถึงระยะประมาณ 10,000 กิโลเมตร (สำหรับน้ำมันเครื่องสังเคราะห์) เมื่อรถวิ่งถึงระยะทางประมาณ 5,000-7,000(สำหรับน้ำมันเครื่องกึ่งสังเคราะห์)หรือควรเปลี่ยนน้ำมันเครื่องทุกๆ 6 เดือน ทั้งนี้ก็ขึ้นอยู่กับว่าจะถึงอย่างใดอย่างหนึ่งก่อนกัน\n\nที่มา: TQM",
    "สายพานทำหน้าส่งผ่านกำลังขับเคลื่อนให้อุปกรณ์ต่างๆ เช่นพัดลมระบายความร้อน ปั๊มน้ำ อัลเทอร์เนเตอร์ตอนใหม่อยู่จะมีความยืดหยุ่นสูง เเต่เมื่อใช้งานไปจึงค่อยๆ เกิดอาการสึกหรอ เเข็งขึน เเละเเตกจึงมีความจำเป็นที่ต้องตรวจสภาพเเละเปลี่ยนออก ทั้งนี้  ก็มีการตรวจสอบหรือปรับตั้งสายพานดังต่อไปนี้ \n 1)\tตรวจเช็คการเเตกร้าว การสึกหรอ หรือเปื้อนน้ำมัน \n\n2)\tตรวจดูว่าร่องสายขับสวมเข้าพอดีกับพูลเลย์หรือไม่\n\nที่มา: klaracing/สายพาน",
    "หัวเทียน เป็นอุปกรณ์ทำหน้าที่ในการ “จุดระเบิด” ให้กับเครื่องยนต์ เป็นกลไกสำคัญของเครื่องยนต์เบนซิน รวมถึง แก๊ส และ ก๊าซ ที่ถ้าหากคุณใช้เครื่องยนต์เบนซินควรที่จะมีการหมั่นตรวจสอบอยู่เสมอ ในรถยนต์บางคันสามารถใช้งานได้เกิน 100,000 กิโลเมตร จึงจะเริ่มแสดงอาการที่ผิดปกติ โดยให้คุณสังเกตอาการเกี่ยวกับความผิดปกติเมื่อหัวเทียนจะหมดอายุการใช้งาน ได้แก่ น้ำมันสิ้นเปลืองมากกว่าปกติ, เร่งรถแซงแล้วพุ่งไปไม่เร็วเหมือนเดิม หรือ รอบเดินมีอาการเบาและสั่นเนื่องจากหัวเทียนมีการจุดระเบิดไม่เต็มที่\n\nที่มา: CARSOME",
    "รอบการเช็คระบบเบรกสำหรับชุดเบรกล้อหน้าควรตรวจเช็คเมื่อขับขี่ถึงระยะ 5,000 กิโลเมตร หรือทุก 6 เดือน ส่วนชุดเบรกล้อหลังควรตรวจเช็กเมื่อขับขี่ถึง\tระยะ 10,000 กิโลเมตร หรือทุก 6 เดือนเช่นกัน ท่อน้ำมันเบรกควรเช็คเมื่อขับขี่ถึงระยะ 10,000 กิโลเมตร หรือทุก 6 เดือน เนื่องจากเมื่อใช้งานมา\tระยะหนึ่งท่อน้ำมันเบรกอาจเกิดการรั่วซึมได้ ในส่วนน้ำมันเบรกควรเช็กเมื่อขับขี่ถึงระยะ 40,000 กิโลเมตร หรือทุก 24 เดือน ซึ่งหากใช้งานน้ำมันเบรกที่เสื่อมคุณภาพก็อาจส่งผลต่อประสิทธิภาพในการเบรกได้\n\nที่มา:  COMPACK-BRAKES",
    "กระจกรถยนต์ เป็นสิ่งแสดงทัศนะวิสัยของผู้ขับขี่ให้มองเห็นเส้นทางได้อย่างชัดเจน ดังนั้นเราไม่ควรปล่อยให้กระจกรถมีความขุ่นมัวหรือเป็นรอย เพราะนั่นจะทำให้เกิดอุบัติเหตุได้เนื่องจากวิสัยทัศน์การมอง \n 1)\tวิธีการเช็ดกระจกรถ การใช้กระดาษหนังสือพิมพ์กับน้ำยาเช็ดกระจกยังเป็นตัวเลือกแรกที่นับว่าดีที่สุดทำให้กระจกมีความใสเหมือนกัน  \n\n2)\tกระจกเป็นรอยหลีกหนีการใช้งานยางต่างๆ ที่เสื่อมสภาพ ใบปัดน้ำฝนที่เสื่อม เพราะนั่นคือสาเหตุที่ทำให้กระจกเป็นรอยควรระมันระวังและรักษาอุปกรณ์ที่เกี่ยวข้อง\n\nที่มา: GRANDPRIX",
    "ของเหลวภายในรถยนต์ไม่ว่าจะอะไรก็แล้วแต่ ล้วนมีระยะการเปลี่ยนถ่ายทั้งนั้น น้ำมันเกียร์ก็เช่นกัน ต้องมีการเปลี่ยนถ่ายน้ำมันเกียร์ตามระยะ เพราะไม่อย่างนั้นฝืนใช้น้ำมันเกียร์ที่เสื่อมสภาพไปเรื่อยๆ จะส่งผลเสียต่อเกียร์ได้ ซึ่งการที่น้ำมันเกียร์เสื่อมสภาพ จะทำให้ประสิทธิภาพในการทำงานลดลง รวมถึงน้ำมันเกียร์สกปรกทำให้เกียร์สึกหรอ ซึ่งระยะเปลี่ยนถ่ายน้ำมันเกียร์อยู่ที่ประมาณทุก 40,000 กิโลเมตร หรือทุก 24 เดือน ทั้งนี้ต้องดูการใช้รถของเราด้วย หากใช้รถตลอดเวลาหรือใ่ช้งานหนักอาจจะต้องเปลี่ยนก่อน\n\nที่มา:  YUKON",
  ];

  // Image Name List Here   // รายการรูปทั้งหมด 9 รูป
  var imgList = [
    'assets/No 9/no1.jpg',
    'assets/No 9/no2.jpg',
    'assets/No 9/no3.jpg',
    'assets/No 9/no4.jpg',
    'assets/No 9/no5.jpg',
    'assets/No 9/no6.jpg',
    'assets/No 9/no7.jpg',
    'assets/No 9/no8.jpg',
    'assets/No 9/no9.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double width = MediaQuery.of(context).size.width * 0.6;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'การดูแลรักษารถยนต์สำหรับมือใหม่ 9 ข้อ', //หัวข้อ AppBar
            style: TextStyle(
                fontSize: 17,
                color: Colors.white,
                fontFamily: 'Chakra',
                fontWeight: FontWeight.bold),
          ),
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromARGB(255, 158, 129, 245), Colors.deepPurple[400]],
                stops: [0.2, 1.0],
              ),
            ),
          ),
        ),
        body: Container(
          width: displayWidth(context),
          child: ListView.builder(
            itemCount: imgList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // This Will Call When User Click On ListView Item
                  showDialogFunc(context, imgList[index], titleList[index],
                      descList[index]); //คลิกแล้วจะแสดงหน้าต่าง
                },
                // Card Which Holds Layout Of ListView Item
                child: Card(
                  //Layout ในรูปแบบของการ์ด
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                     
                      Container(
                      
                      width: displayWidth(context)*0.2,
                      height: displayHeight(context)*0.1,  
                      child: Image.asset(imgList[index],
                      fit: BoxFit.fitWidth,
                      ),
                      
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            AutoSizeText(
                              titleList[index],
                              style: TextStyle(
                                  fontSize: displayWidth(context)*0.05,
                                  color: Colors.black, //สีตัวหนังสือข้อ 1-9
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Chakra'),
                                  minFontSize: 14,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: width,
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
        ),
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
      return SingleChildScrollView(
        child: Container(
           height: displayHeight(context) - MediaQuery.of(context).padding.top - kToolbarHeight*3,
          width: MediaQuery.of(context).size.width ,
          //height: MediaQuery.of(context).size.height*0.5,
          child: Padding(
            padding: const EdgeInsets.only(top:50.0),
            child: Material(
              type: MaterialType.transparency,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white, //พื้นหลังสีขาว box เนื้้อหา
                ),
                padding: EdgeInsets.all(15), //ขนาดความสูง
               
         
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topRight,
                        child: SizedBox(
                          //กดเพื่อ clear รูปภาพ ข้อมูล
                          width: 50,
                          child: Container(
                            height: 40,
                            width: 40,
                            child: FloatingActionButton(
                              //icon กดเคลียร์รูปภาพ
                              //heroTag: 'ClearState',
                              heroTag: null,
                              onPressed: () => Navigator.pop(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dashboard())),
                              backgroundColor: Colors.red,
                              child: Icon(
                                //Icons.clean_hands_outlined,
                                Icons.keyboard_return,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                          //รูปภาพและขนาดของภาพ
                          img,
                          // width: 250,
                          //height: 250,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      AutoSizeText(
                        title, //หัวข้อในส่วนเนื้อหา
                        style: TextStyle(
                            fontSize: 20,
                            
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Chakra'),
                            minFontSize: 18,
                
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          // width: 200,
                          width: displayWidth(context),
                          
                          child: Align(
                            //ส่วนของการจัดเนื้อหา
                            alignment: Alignment.center,
                            child: AutoSizeText(
                              desc,
                              maxLines: 50,
                              style: TextStyle(
                                 fontSize: 18,
                                 
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Chakra'
                                  
                                  ),
                                  minFontSize: 15,
                                  overflow: TextOverflow.visible,
                              
                              
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
