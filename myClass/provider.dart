import 'dart:io';
import 'package:flutter/material.dart';

/*
to use 
to get value
JopsProv ch = Provider.of<JopsProv>(context, listen: false);

to save             
ch.Visiblty_Add_Ads(statePublic);
*/

class Shopping_car with ChangeNotifier {
  /// Shopping_car ch = Provider.of<Shopping_car>(context, listen: false);
  /// ch.shop_car
  List shop_car = [];

  var custemer = '';

  var token = '';

  int notoifction_chat = 0;

  /// Shopping_car ch = Provider.of<Shopping_car>(context, listen: false);
  /// ch.Visiblty_Add_Ads(list);
  In_car(Map list) {
    shop_car.add(list);
    notifyListeners();
  }

  custemername(value) {
    custemer = value;
    notifyListeners();
  }

  tokenUser(value) {
    token = value;
    notifyListeners();
  }

  notoifction() {
    notoifction_chat ++ ;
    notifyListeners();
  }
}

// provider Class
// ignore: camel_case_types
class JopsProv with ChangeNotifier {
  /// visiblty login
  late List visibltyAddAds;

  ///provider visible bool
  Visiblty_Add_Ads(List visibl) {
    visibltyAddAds = visibl;
    notifyListeners();
  }

  ///  Flie image path
  late File imagePathReceive;

  /// provider Flie image path
  FunImagePathreceive(File imagePath) {
    imagePathReceive = imagePath;
    print('imagePathReceive : $imagePathReceive');
    notifyListeners();
  }

  /// visiblty login
  late String visibleWidgte;

  ///provider visible bool
  Visibilitaredy(String visibl) {
    visibleWidgte = visibl;
    notifyListeners();
  }

  int ch1 = 0;
  int ch2 = 0;
  change1() {
    ch1++;
    //print(ch1);
    notifyListeners();
  }

  change2() {
    ch2++;
    print(ch2);
    notifyListeners();
  }
  // this vareble for tasks app
  //List<String> listDayNote = [];
  //List<String> listSubjact = [];

// this vareble for tasks app
//you should use this void to completey sync changes in apps
  // listchange(List listDN, List listSN) {
  //   listDayNote = listDN;
  //   listSubjact = listSN;
  //   print('$listDayNote###$listSubjact');
  //   notifyListeners();
  // }
}
