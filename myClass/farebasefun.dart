// ignore_for_file: file_names

import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path/path.dart' as p;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FarebaseFun {
  /// get name or Email from firebaseAuth
  String? inputData() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser!;
    if (user != null) {
      final uid = user.email;
      print(uid);
      return uid;
    } else {
      return "public";
    }
    // here you write the codes to input the data into firestore
  }

  /// to delet docmention by id
  Future<void> DeletDocId(String jobId) {
    final firestoreInstance = FirebaseFirestore.instance;
    return firestoreInstance.collection('uuuu').doc(jobId).delete().then((_) {
      print("success!");
    });
  }

  /// delet image from storge firebase
  /*
  DeletFireSturge(String imageUrl) async {
    StorageReference ref =
        await FirebaseStorage().getReferenceFromUrl(imageUrl);
    ref.delete().then((_) {
      print("success!");
    });
  }
  */

  /// ***fainl function to aplode image and text
  /*
  Future<String> uplode(File imageFlie, String adsTitle, String adsInf,
      String stateuser, BuildContext context) async {
    try {
      FirebaseStorage storge =
          FirebaseStorage(storageBucket: 'gs://jops-2d0ef.appspot.com');
      StorageReference ref = storge.ref().child(p.basename(imageFlie.path));
      StorageUploadTask storageUploadTask = ref.putFile(imageFlie);
      StorageTaskSnapshot taskSnapshot = await storageUploadTask.onComplete;
      String utl = await taskSnapshot.ref.getDownloadURL();
      print(utl);
      //////
      String a = utl;
      DocumentReference refdoc =
          FirebaseFirestore.instance.collection("uuuu").doc();
      refdoc.set({
        'sub': adsTitle,
        'inf': adsInf,
        'stateUser': stateuser,
        'image': a,
        "post_id": refdoc.id,
        /*
      "name": "john",
      "age": 50,
      "email": "example@example.com",
      "address": {"street": "street 24", "city": "new york"}
    */
      }).then((_) {
        print("success!");
        // widgetFan().showToast(context, 'بانتظار الموافقة ');
        // Navigator.pop(context);
      });
      print('HHHH : ${refdoc.id}');
      return refdoc.id;
    } catch (ex) {
      print('رسالة خطا ');
      print(ex.massage);
    }
  }
  */

  ///update value field
  // ignore: non_constant_identifier_names
  UpdateDocFirebase(
      String collec, String docId, String fieldName, String insertValue) {
    FirebaseFirestore.instance.collection(collec).doc(docId).update(
        {fieldName: insertValue}).then((value) => print("Success Update!"));
  }

  /// search ID in firebase
  // ignore: missing_return
  // ignore: non_constant_identifier_names
  // ignore: missing_return
  /*
  Future<List<String>> UserNameID(List<String> userId) async {
    var h = await FirebaseFirestore.instance
        .collection('uuuu')
        .doc(userId[0])
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print(
            'documentSnapshot.data() :: ${documentSnapshot.data()['stateUser'] == 'true'}');
        if (documentSnapshot.data()['stateUser'] == 'true') {
          // alwase we poss on false ads
          print('رسالة ما راح تشوفها');
          userId[1] = 'auth';
          ClassVoid().SavePref(userId, '4');
          return userId;
        } else {
          print('يبقى $userId');
          return userId;
          // return Colors.green;
        }
      } else {
        userId[1] = 'unauth';
        //FunctionJobs().DeletDocId(userId);
        ClassVoid().SavePref(userId, '4');
        print('Dont exists !!!!!!');
        return userId;
        // return Colors.white;
      }
    });
    return h;
  }
  */
}
