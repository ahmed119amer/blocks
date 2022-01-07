// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'classVoid.dart';
import 'farebasefun.dart';

/// class for all widget function
  Future<void> _showMyDialog(userId, context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: Text('اعلان غير موثق'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('هذا الاعلان من مستخدم عام'),
                  Text('هل توافق على ان يستمر في النشر او ايقاف والمسح'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('مسح'),
                onPressed: () {
                  FarebaseFun().DeletDocId(userId);
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                  child: Text('أوافق'),
                  onPressed: () {
                    FarebaseFun()
                        .UpdateDocFirebase('uuuu', 'stateUser', 'true', userId);
                    Navigator.of(context).pop();
                  })
            ],
          ),
        );
      },
    );
  }

  /// to Navigate page
  Future navigateToPage(BuildContext context, page) async {
    Null? t = await Navigator.push(
        context, MaterialPageRoute<Null>(builder: (context) => page));
    print(t);
  }



  /// toast
  void showToast(BuildContext context, String massege) {
    final scaffold = Scaffold.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(massege),
        action: SnackBarAction(
            label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  ///Button icon
  CircaleChack(chack, id, context) {
    Color color;
    if (chack == "false") {
      color = Colors.red;
      return Visibility(
          visible: ClassVoid().StateVisiblty(),
          child: IconButton(
              color: color,
              icon: Icon(Icons.check_circle_outline_outlined),
              onPressed: () {
                _showMyDialog(id, context);
                // UserNameID(id);
              }));
    } else {
      color = Colors.white;
      return Text("");
    }
  }



  Navigator_pop(BuildContext context,  page) {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }