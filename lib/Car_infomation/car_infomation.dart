// ignore: unused_import
import "dart:convert";
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    // TODO: implement initState
    super.initState();

    Future<void> readJson() async {
      final String response =
          await rootBundle.loadString('assets/datacar/data.json');
      final data = await json.decode(response);
      String namecar = widget.namecar.replaceAll(' ', '_');
      setState(() {
        _items = data[namecar];
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
            Text(widget.namecar),
            // Display the data loaded from sample.json
            (_items != null)
                ? Expanded(
                    child: ListView.builder(
                      itemCount: _items.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                            leading: Text(_items[index]["ชื่อรุ่น"]),
                            title: Text(_items[index]["ประเภทรถยนต์"]),
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
