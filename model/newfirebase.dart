import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


/// add users
Future<void> addUser(users, fullName, company, age) {
  String id = users.doc().id;
  // Call the user's CollectionReference to add a new user
  return users
      .add({
        'id': id,
        'full_name': fullName, // John Doe
        'company': company, // Stokes and Sons
        'age': age // 42
      })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}

///update value field
UpdateDocFirebase(
    String collec, String docId, String fieldName, String insertValue) {
  FirebaseFirestore.instance.collection(collec).doc(docId).update(
      {fieldName: insertValue}).then((value) => print("Success Update!"));
}

/// to save namecustamer data
uplodename(collectionfather, id, String name, number, image,
    BuildContext context) async {
  var noww = DateTime.now();
  var formattedDate = DateFormat('yyyy-MM-dd–kk:mm:ss').format(noww);
  var tok = await token(context);
  try {
    FirebaseFirestore.instance.collection(collectionfather).doc(id).set({
      'date': formattedDate,
      'name': name,
      'number': number,
      'image': image,
      "post_id": id,
      'token': tok
    }).then((_) {
      print("success!");
      // widgetFan().showToast(context, 'بانتظار الموافقة ');
      // Navigator.pop(context);
    });
    print('HHHH : ${id}');
    return id;
  } catch (e) {
    print('رسالة خطا $e');
  }
}

/// save massages for name custemer
subcollction(sender, idfather, massges, massege, send, sendToToken,
     context,{listScrollController}) async {
  var rng = Random();
  var id = rng.nextInt(10000000).toString();
  var noww = DateTime.now();
  var formattedDate = DateFormat('yyyy-MM-dd–kk:mm:ss').format(noww);
  final databaseReference = FirebaseFirestore.instance;
  databaseReference
      .collection(sender)
      .doc(idfather)
      .collection(massges)
      .doc(id)
      .set({
    'date': formattedDate,
    'send': send,
    'id': id,
    'massage': massege,
    'send_to': sendToToken,
  }).then((_) {
    if(listScrollController!=null){
      if (listScrollController.hasClients) {
      final position = listScrollController.position.maxScrollExtent;
      listScrollController.jumpTo(position);
    }
    }
    
    print("success!");
    // widgetFan().showToast(context, 'بانتظار الموافقة ');
    // Navigator.pop(context);
  });
}

/// with genration id from firebase
uplode(collection, String name, String nomber, String image,
    BuildContext context) async {
  try {
    DocumentReference refdoc =
        FirebaseFirestore.instance.collection(collection).doc();
    refdoc.set({
      'name': name,
      'nomber': nomber,
      'image': image,
      // 'image': a,// image
      "post_id": refdoc.id,
    }).then((_) {
      print("success!");
      // widgetFan().showToast(context, 'بانتظار الموافقة ');
      // Navigator.pop(context);
    });
    print('HHHH : ${refdoc.id}');
    return refdoc.id;
  } catch (ex) {
    print('رسالة خطا $ex');
  }
}

/// time with secend
String intldate() {
  var noww = DateTime.now();
  return DateFormat('yyyy-MM-dd–kk:mm:ss').format(noww);
}

/// get feild from id doc
getDoc(collction, docId, feild) async {
  var doc = FirebaseFirestore.instance.collection(collction).doc(docId);
  var docfeild = doc.get();
  var token = docfeild.then((value) {
    print('token #### ${value[feild]}');
    return value[feild];
  });
  return token;
}

/// get token and send to provider
token(context) {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  var token = _firebaseMessaging.getToken().then((token) {
    print('token ::::::::::: $token'); // Print the token in Console
    return token;
  });
  return token;
}
