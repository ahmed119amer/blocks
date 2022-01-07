import 'dart:convert';

import 'package:http/http.dart' as http;

/// dont use it
sample_fetch() async {
  var res = await http.get(Uri.parse("https://sajad2021.herokuapp.com/Catgs"));
  if (res.statusCode == 200) {
    var obj = json.decode(res.body);
    print(obj);
  }
}
/// Available_resolution in json
Available_resolution(u) {
  if (u['Iarge'] != null) {
    // print('Iarge');
    return u['Iarge']['url'];
  } else if (u['medium'] != null) {
    // print('medium');
    return u['medium']['url'];
  } else if (u['small'] != null) {
    // print('small');
    return u['small']['url'];
  } else {
    // print('thumbnail');
    return u['thumbnail']['url'];
  }
}
