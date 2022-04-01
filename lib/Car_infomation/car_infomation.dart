// ignore: unused_import
import "dart:convert";
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Car_infomation/Datacar_info.dart';


// ignore: must_be_immutable
class Carinfomation extends StatefulWidget {
  String namecar;
  Carinfomation({Key key, this.namecar}) : super(key: key);
  @override
  _CarinfomationState createState() => _CarinfomationState();
}

class _CarinfomationState extends State<Carinfomation> {
  List _items = [];

  // Fetch content from the json file

  @override
  void initState() {
    // ignore: todo 
    // TODO: implement initState
    super.initState();

    Future<void> readJson() async {
      final String response =
          await rootBundle.loadString('assets/datacar/data.json');
      final data = await json.decode(response);

      setState(() {
        _items = data[widget.namecar];
      });
    }

    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[400],
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: Text(widget.namecar,style: TextStyle(fontFamily: 'Chakra',fontWeight: FontWeight.bold,fontSize: 18),),
            ),
            // Display the data loaded from sample.json
            (_items != null)
                ? Expanded(
                    child: ListView.builder(
                      itemCount: _items.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(10),
                          child: Container(
                        height: 70,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          color: Colors.white,
                          shape: StadiumBorder(
                            side: BorderSide(
                                color: Colors.deepPurple[800], width: 3),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Datacarinfo()));
                          },
                          child: ListTile(
                            leading: Text("รุ่น : \t"+_items[index]["ชื่อรุ่น"] +"\t\t"+ _items[index]["ประเภทรถยนต์"],style: TextStyle(fontFamily: 'Chakra',fontWeight: FontWeight.bold,fontSize: 18),),
                            //title: Text(_items[index]["ประเภทรถยนต์"],style: TextStyle(fontFamily: 'Chakra',fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ),
                        );
                      },
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
