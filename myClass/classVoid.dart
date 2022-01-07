import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toys_child/blocks/myClass/farebasefun.dart';
import 'package:toys_child/blocks/myClass/provider.dart';

class ClassVoid {
  /// return text by start and end
  /// we need chack if string contant arabc or enghlsh .
  String TextMore(String text, startText, endText) {
    String textwithoutspace;
    var words = [];
    var p = 0;
    //
    if (text[text.length - 1] == ' ') {
      textwithoutspace = text.substring(0, text.length - 1);
      print('we remove lest space');
      if (text[0] == ' ') {
        // textwithoutspace = text.substring(0, 0);
        print(' start space');
        // textwithoutspace = text;
      } else {
        print('dont start space');
        textwithoutspace = ' ' + textwithoutspace;
        // textwithoutspace = text;
      }
    } else if (text[0] == ' ') {
      textwithoutspace = text;
      print('we remove start space');
    } else {
      print('No any space');
      text = ' ' + text;
      textwithoutspace = text;
    }
    // textwithoutspace = text;
    // print(textwithoutspace);
    // print('gggg :: ${text[0] == ' '}');
    while (p < textwithoutspace.length) {
      if (textwithoutspace[p] == ' ') {
        // print('i :: ${textwithoutspace[p + 1]} :: $p');
        var first = textwithoutspace[p + 1];
        for (var n = p + 2; n < textwithoutspace.length; n++) {
          if (textwithoutspace[n] == ' ') {
            break;
          }
          first = first + textwithoutspace[n];
          // print('n :: ${n}');
        }
        // print('word p =$p :: ${first}');
        words.add(first);
      }
      //  else {
      //   print('ff :: ${textwithoutspace[p]}');
      // }
      p++;
    }
  var partOfList;
  var d;
  if (words.length < endText) {
    partOfList = words.getRange(startText, words.length);
    d = partOfList.join(' ').toString();
  } else {
    partOfList = words.getRange(startText, endText);
    d =  partOfList.join(' ')+('...') .toString();
  }
    // print((partOfList.join(' ') + '...'));

    // print(partOfList.join(' '));
    return d;
  }

  /// to stpo add bottun if he add tow adses
  ThereOnceAdsByOneDay(List list) {
    var day = DateTime.now().day.toString();
    // var day = 11.toString();
    if (list[2].isEmpty) {
      print('eeeeeeee');
      return true;
    } else {
      if (list[3] == day) {
        if (int.parse(list[2]) >= 4) {
          print('choce >= 3');
          return false;
        } else if (int.parse(list[2]) < 4) {
          print('choce <= 3');
          return true;
        } else {
          print('شني هاي ههههها');
          return true;
        }
      } else {
        print('غير يوم');
        list[2] = '0';
        // SavePref(list, '4');
        return true;
      }
    }
  }

  /// visiblty for admin login and logout
  bool StateVisiblty() {
    var typeUser = FarebaseFun().inputData();
    if (typeUser == "public") {
      return false;
    } else {
      return true;
    }
  }

  /// state mangment provaider from add ads  to home page
  ProvChak(chackPro, context, state) {
    if (chackPro == true) {
      JopsProv ch = Provider.of<JopsProv>(context);
      if (ch.visibltyAddAds != null) {
        if (ch.visibltyAddAds[1].isEmpty) {
          state = ch.visibltyAddAds[0];
          return state;
        } else {
          state = ch.visibltyAddAds[1];
          return state;
        }
      }
      return state;
      // if (ch.visibltyAddAds != null) {
      //   print('ch.visibltyAddAds :: ${ch.visibltyAddAds.length}');
      //   state = ch.visibltyAddAds;
      //   print('كركري');
      // }
    }
  }

  /// visiblty for public
  bool FinalNameVisiblty(
      String state, // from get
      BuildContext context,
      bool chackPro // chack
      ) {
    state = ProvChak(chackPro, context, state);
    String typeUser = FarebaseFun().inputData()!;
    if (typeUser == "public") {
      if (Publicbool(state) < 3) {
        return true;
      } else {
        return false;
      }
    } else {
      return true;
    }
  }

  /// 1 and 2 true
  /// 3 and 4 false
  Publicbool(String state) {
    if (state == "auth") {
      print('stat2 : $state : 2');
      //auth
      // add_ads Available
      return 2;
    } else if (state == "unauth") {
      print('stat3 : $state : 4');
      //unauth
      // add_ads Unavailable
      return 4;
    } else if (state.length > 6) {
      print('stat1 : $state : 3');
      //review
      // add_ads Unavailable
      return 3;
    } else {
      print('stat4 : $state : 1');
      // frist ads
      // add_ads Available
      return 1;
    }
  }

  ///to save list in SharedPreferences
  /*
  SavePref(List visibl, String kay) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setStringList(kay, visibl);
    print('save${preferences.getStringList(kay)}');
    //print(kay);
  }
  */

  /// to get List to content with lost list itame
  Future<List<String>?> get(String kay) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // this setState() to change name_vote in ganreter class
    List<String>? cuntry = preferences.getStringList(kay);
    print('cuntry : $cuntry');
    return cuntry;
  }
}

// غير مستخدم
/// to save data in firbase
void _onPressed(conSub, conInf, url) {
  final firestoreInstance = FirebaseFirestore.instance;
  //final firestoreInstance = FirebaseFirestore.instance;
  //var firebaseUser = await FirebaseAuth.instance.currentUser();
  firestoreInstance.collection("uuuu").doc().set({
    'sub': conSub,
    'inf': conInf,
    'image': url,
    /*
      "name": "john",
      "age": 50,
      "email": "example@example.com",
      "address": {"street": "street 24", "city": "new york"}
    */
  }).then((_) {
    print("success!");
  });
  //nom++;
}

//غير مستخدم

/// to retuen String url wuthout setState function
/// onPressed: () async {
/// Uplode();
/// String imageFirebas = await Uplode();
/// print(imageFirebas);
/// do not use
/*
Future<String> UplodeImage(image) async {
  FirebaseStorage storge =
      FirebaseStorage(storageBucket: 'gs://jops-2d0ef.appspot.com');
  StorageReference ref = storge.ref().child(p.basename(image.path));
  StorageUploadTask storageUploadTask = ref.putFile(image);
  StorageTaskSnapshot taskSnapshot = await storageUploadTask.onComplete;
  String utl = await taskSnapshot.ref.getDownloadURL();
  print(utl);
  return utl;
}
*/
