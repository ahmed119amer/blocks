import 'package:flutter/material.dart';

/// class of Tasks fun app
class Tasksfun {
  /// to get weekday from day
  dayNew(int day) {
    List<String> DaysWeek = ['ح', 'ن', 'ث', 'ر', 'خ', 'ج', 'س'];
    var dayWeek = new DateTime.utc(2021, 1, day + 1).weekday;
    return DaysWeek[dayWeek - 1];
  }

  /// to return 30 day list
  ListDay(int cont, int StartNum, List listday) {
    for (var j = StartNum; j < cont + 1; j++) {
      listday.add(j.toString());
      print(j);
    }
    return (listday);
  }

  /// Day and Month to return ===> List
  List<String> DayslashMonth(
      int contMonth, DateTime date, List<String> listday) {
    var Month = <int>[31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    var j;
    for (var i = date.month; i < contMonth + date.month; i++) {
      if (i == date.month) {
        for (j = date.day; j < Month[i - 1] + 1; j++) {
          //print('${i}/${j} : ${WeeklyDay(j, i, date.year)}');
          listday.add('${i}/${j}');
          //print('${i}/${j}');
        }
      } else {
        for (j = 1; j < Month[i - 1] + 1; j++) {
          //print('${i}/${j} : ${WeeklyDay(j, i, date.year)}');
          listday.add('${i}/${j}');
          //print('${i}/${j}');
        }
      }
    }
    //print(listday);
    return listday;
  }

  /// return name week
  WeeklyDay(int day, int month, int year) {
    var weekname = <String>[
      'الاحد',
      'الاثنين',
      'الثلاثاء',
      'الاربعاء',
      'الخميس',
      'الجمعة',
      'السبت'
    ];
    int daycorrect = day + 1;
    var weekday = DateTime.utc(year, month, daycorrect).weekday;
    return weekname[weekday - 1];
  }

  /// to get count itame in list
  /// to get count elemint in list return 1000 if ont exist
  
   Chake(String x, List list) {
    if (list.contains(x)) {
      for (var c = 0; c < list.length; c++) {
        if (x == list[c]) {
          print('c$c##${list[c]}');
          return c;
        }
      }
    } else {
      return 1000;
    }
  }
  

  /// to get month and day from single string
  List<String> GetDayMonth(List<String> list, String type) {
    List<String> res = [];
    var start, end, endPlus;
    if (type == 'month') {
      start = 0;
      end = 1;
      endPlus = 1;
    } else {
      start = 2;
      end = 4;
      endPlus = 3;
    }
    for (var j = 0; j < list.length; j++) {
      if (list[j].length == 4) {
        //print('4');
        //print(list[j].substring(m,d));
        res.add(list[j].substring(start, end));
      } else {
        //print('3');
        //print(list[j].substring(2, 3));
        res.add(list[j].substring(start, endPlus));
      }
    }
    //print(res);
    return res;
  }

  /// المشكلة هي الملاحظة الثالثة مفقودة فلا ستيطع عرضها شهلة
  /// to get note on day
  ChakeNote(String X, List<String> listsub, List<String> listDayN) {
    print('${listsub}${listDayN}');
    int C = Chake(X, listsub);
    if (C == 1000) {
      return '';
    } else {
      return '${listDayN[C]}';
    }
  }

  /// height itame note day
  HeightNote(List Name, List SubCH, int index) {
    int C = Chake(Name[index], SubCH);
    if (C == 1000) {
      return 40.0;
    } else {
      return 75.0;
    }
  }

  /// Color Holiday
  Color? ColorDayHoliday(List<String> list, int index) {
    if (WeeklyDay(int.parse(GetDayMonth(list, 'day')[index]),
            int.parse(GetDayMonth(list, 'month')[index]), 2021) ==
        'الجمعة') {
      return Colors.green;
    } else if (WeeklyDay(int.parse(GetDayMonth(list, 'day')[index]),
            int.parse(GetDayMonth(list, 'month')[index]), 2021) ==
        'السبت') {
      return Colors.green;
    } else {
      return null;
    }
  }
}