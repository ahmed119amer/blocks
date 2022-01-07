// ignore_for_file: file_names

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toys_child/blocks/model/varlube.dart';
import 'package:toys_child/blocks/myClass/provider.dart';
import 'package:toys_child/model/models.dart';

class ResiveNotifction extends StatefulWidget {
  const ResiveNotifction({Key? key}) : super(key: key);

  @override
  _ResiveNotifctionState createState() => _ResiveNotifctionState();
}

class _ResiveNotifctionState extends State<ResiveNotifction> {
  var counter = 0;
  var fontsize = const TextStyle(fontSize: 50);

  @override
  void initState() {
    FirebaseMessaging.instance.getInitialMessage();
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
    FirebaseMessaging.onMessage.listen((massege) {
      if (massege.notification != null) {
        Vvvv();
        debugPrint(
            'massege:::${massege.notification!.body}::${massege.notification!.title}');
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((massege) {});
    FirebaseMessaging.instance.getInitialMessage().then((r) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Shopping_car ch = Provider.of<Shopping_car>(context, listen: true);
    counter = ch.notoifction_chat;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lighttheme,
      darkTheme: darktheme,
      home: Scaffold(
        appBar: AppBar(
          // shape: const RoundedRectangleBorder(
          //   borderRadius: BorderRadius.vertical(
          //     // top :Radius.circular(15),
          //     bottom: Radius.circular(15),
          //   ),
          // ),
          centerTitle: true,
          title: Text("title"),
          // actionsIconTheme: const IconThemeData(color: Colors.black),
          // backgroundColor: const Color(0xFFFF942C),
          backgroundColor: Colors.transparent,
          elevation: 0,
          // actions:  [noti(3, 25)],
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Center(
            // child: noti(25,),
          ),
        ),
      ),
    );
  }

  void Vvvv() {
    // setState(() {
    //   counter++;
    // });
    Shopping_car ch = Provider.of<Shopping_car>(context, listen: false);
    ch.notoifction();

    print(ch.notoifction_chat);
  }
}

