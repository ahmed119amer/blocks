// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';


// https://rrtutors.com/tutorials/Nested-Listview-in-flutter

class listinlist extends StatefulWidget {
  const listinlist({Key? key}) : super(key: key);

  @override
  _testState createState() => _testState();
}

class _testState extends State<listinlist> {
  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: [
      
      Column(
        children: [Container(
          width: double.infinity,
          padding: const EdgeInsets.all(4),
          color: Colors.red,
          margin: const EdgeInsets.only(left: 8, top: 8, right: 8),
          child: const Text(
            "Mario",
            style: TextStyle(fontSize: 24, color: Colors.white),
          )),
          Container(
            color: Colors.white,
            margin: const EdgeInsets.only(left: 8, right: 8),
            height: 160,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Card(
                      child: Column(
                        children: [
                          Image.network(
                            "https://purepng.com/public/uploads/large/purepng.com-mariomariofictional-charactervideo-gamefranchisenintendodesigner-1701528634653vywuz.png",
                            width: 100,
                            height: 100,
                          ),
                          Container(
                              width: 100,
                              color: Colors.grey[200],
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: Text("Mario $index ")),
                              ))
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    ]);
  }
}
