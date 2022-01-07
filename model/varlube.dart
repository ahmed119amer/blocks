import 'package:flutter/material.dart';
import 'package:toys_child/blocks/myClass/widgetfan.dart';
import 'package:toys_child/pags/massenger.dart';


/// appBar ith black colors 
appbars(title) {
  return AppBar(
    centerTitle: true,
    elevation: 0,
    // color of icon back who is ganrater when navagater from another page 
    iconTheme:const IconThemeData(color: Colors.black),
  );
}


/// appbar with icon action
appbar(title) {
  return AppBar(
    // shape: const RoundedRectangleBorder(
    //   borderRadius: BorderRadius.vertical(
    //     // top :Radius.circular(15),
    //     bottom: Radius.circular(15),
    //   ),
    // ),
    centerTitle: true,
    title: Text(title),
    // actionsIconTheme: const IconThemeData(color: Colors.black),
    // backgroundColor: const Color(0xFFFF942C),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions:  [
      Builder(
        builder: (context) {
          return IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              Navigator_pop(context,const massenger());
            },
          );
        }
      )
    ],
  );
}

ThemeData lighttheme = ThemeData(
    fontFamily: 'IBMPlexSansArabic',
    bottomAppBarColor: Colors.black,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      titleTextStyle:
          TextStyle(color: Colors.black, fontSize: sizefontpageitame),
      actionsIconTheme: const IconThemeData(color: Colors.black),
    ));
ThemeData darktheme = ThemeData(
    fontFamily: 'IBMPlexSansArabic',
    bottomAppBarColor: Colors.white,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      actionsIconTheme: IconThemeData(color: Colors.white),
    ));

/// ##################### متغيرات ###############################
double sizefontpageitame = 22;
