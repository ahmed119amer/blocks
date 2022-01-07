import 'dart:convert';
import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toys_child/blocks/model/classjason.dart';
import 'package:toys_child/blocks/myClass/hivedb.dart';
import 'package:toys_child/blocks/myClass/provider.dart';
import 'package:toys_child/pags/massenger.dart';
import 'package:toys_child/pags/toy_page.dart';
import 'package:http/http.dart' as http;
import 'package:toys_child/pags/toysfromcolaction.dart';

double width_toy = 111;
double height_toy = 111;
double size_font_main=20;

/// fun for ratinge main page
Widget Ratings(String nmaeRatings, List list, double height, double width) {
  return Container(
    height: height,
    // width: width,
    // color: Colors.white,
    margin: const EdgeInsets.only(top: 10.0, bottom: 10),
    child: ListView.builder(
      physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Get.to(const toy_page());
              // widgetFan().navigateToPage(context, const toy_page());
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => toy_page(list[index])),
              );
            },
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: CachedNetworkImage(
                height: height,
                width: width,
                fit: BoxFit.cover,
                imageUrl: list[index]['image']['formats']['thumbnail']['url'],
                placeholder: (context, url) => const Center(
                    child: SizedBox(
                        height: 100,
                        width: 100,
                        child: CircularProgressIndicator())),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              margin: const EdgeInsets.all(10),
            ),
          );
        }),
  );
}

/// builder data as a list
Widget List_builder_Json(fatchApi, List simpleJson) {
  var connectivityResult;
  return FutureBuilder(
      future: fatchApi.fatchData(),
      builder: (context, AsyncSnapshot<List<class_json_main_items>> snapshot) {
        if (snapshot.hasData) {
          print('من الانترنيت');
          instartHiveWrite(connectivityResult);
          // snapshot.connectionState == ConnectionState.done
          // return cache(snapshot.data!);
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                List o = snapshot.data![index].games;
                // print(snapshot.data![index]);
                // HiveWrite('1', snapshot);
                return Center(
                  child: o.isEmpty
                      ? const SizedBox.shrink()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  // top: 10.0, bottom: 10,
                                  right: 10),
                              child: Text(snapshot.data![index].name,
                                  style:  TextStyle(fontSize: size_font_main,fontWeight: FontWeight.bold)),
                            ),
                            Ratings(snapshot.data![index].name, o, width_toy, height_toy),
                          ],
                        ),
                );
              });
        }
        // عدم استخدام هذا الجزء وذلك لانه Snapshot dont objact in future buikder
        // else if(snapshot.hasError){
        //   throw snapshot.error;
        // }
        else if(simpleJson.isEmpty){
          print('empty');
          return Center(child: const CircularProgressIndicator());
        }
        else {
          print('من الجهاززززززززززز ${simpleJson.length}');
          // Fatch_api fatchapi=Fatch_api(uri: 'https://sajad2021.herokuapp.com/Catgs').Fatch_hive_json(HiveRead('1'));
          return cache(simpleJson);
          // return const Center(child: CircularProgressIndicator());
        }
      });
}

/// first show from database
cache(listCache) {
  return ListView.builder(
      itemCount: listCache.length,
      itemBuilder: (context, index) {
        List o = listCache[index]['games'];
        return Center(
            child: o.isEmpty
                ? const SizedBox.shrink()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            // top: 10.0, bottom: 10,
                            right: 10),
                        child: Text(listCache[index]['name'],
                            style:  TextStyle(fontSize: size_font_main)),
                      ),
                      Ratings(listCache[index]['name'], o, width_toy, height_toy),
                    ],
                  ));
      });
}

/// write json to hive if intrnat exsit!!
instartHiveWrite(connectivityResult) async {
  connectivityResult = await (Connectivity().checkConnectivity());
  List json = await git_ahmed('https://sajad2021.herokuapp.com/Catgs');
  if ((connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) &&
      json != []) {
    debugPrint('يتم الكتابة');
    HiveWrite('1', json);
  }
}

/// get json api
Future<List> git_ahmed(String url) async {
  final response = await http.get(Uri.parse(url));
  print('complet');
  List<dynamic> body = jsonDecode(response.body);
  return body;
}

/// sub json price
subjsonprice(list) {
  double o = 0;
  for (var i in list) {
    o += i['price'];
    print('${i['name']} :: $o');
  }
  return o;
}

/// i dont know
notii(double iconsize, widght, {posss}) {
  return Builder(builder: (context) {
    Shopping_car ch = Provider.of<Shopping_car>(context, listen: true);
    var counter = ch.notoifction_chat;
    if (posss != null) {
      counter = ch.shop_car.length;
    }
    return Center(
      child: SizedBox(
        width: iconsize,
        // color: Colors.yellowAccent,
        child: Stack(
          children: <Widget>[
            widght,
            counter != 0
                ? Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: BoxConstraints(
                        minWidth: iconsize / 10,
                        minHeight: iconsize / 10,
                      ),
                      child: Text(
                        '$counter',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: iconsize / 3.33,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  });
}


/// vareble auth chack
bool visiblechackAuth() {
  var admin = inputData();
  if (admin! == 'public') {
    // setState(() {});
    return false;
  }
  return true;
}

/// stream firbase
Widget streamFire() {
  return StreamBuilder(
    stream: FirebaseFirestore.instance
        .collection('toys')
        // .doc(id)
        // .collection('massges')
        // .orderBy('date', descending: false)
        .snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (!snapshot.hasData) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 2,
        // Generate 100 widgets that display their index in the List.
        children: snapshot.data!.docs.map((document) {
          return cardcolca(document['url'], document['name'], 20, context);
        }).toList(),
      );
    },
  );
}

/// #  card image
Widget cardcolca(url, text, textsize, context) {
  return Column(
    children: [
      Expanded(
        child: GestureDetector(
          onTap: () {
            // Get.to(const toy_page());
            // widgetFan().navigateToPage(context, const toy_page());
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const Toysfromcolaction()),
            );
          },
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: CachedNetworkImage(
              height: 100,
              width: 300,
              fit: BoxFit.cover,
              imageUrl: url,
              placeholder: (context, url) => const Center(
                  child: SizedBox(
                      // height: 100,
                      // width: 100,
                      child: CircularProgressIndicator())),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            margin: const EdgeInsets.all(10),
          ),
        ),
      ),
      Text(text,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
          ))
    ],
  );
}

/// calculateDistance between two lat & lon 
double calculateDistance(lat1, lon1, lat2, lon2) {
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 -
      c((lat2 - lat1) * p) / 2 +
      c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
  print(12742 * asin(sqrt(a)));
  return 12742 * asin(sqrt(a));
}

/// # delivery price
Delivery_price(double distance) {
  if (distance > 10) {
    return '10000';
  } else {
    return '5000';
  }
}