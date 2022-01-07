import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toys_child/blocks/model/classjason.dart';


class Fatch_api {
  late String uri;
  Fatch_api({
    required this.uri,
  });
  void Fatch_hive_json(dynamic body){
    List<class_json_main_items> data = [];
    for (var itame in body) {
        data.add(class_json_main_items.fromJson(itame));
      }
  }
  Future<List<class_json_main_items>> fatchData() async {
    List<class_json_main_items> data = [];
    var ura = Uri.parse(uri);
    http.Response response = await http.get(ura);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);

      for (var itame in body) {
        data.add(class_json_main_items.fromJson(itame));
      }
    }
    return data;
  }
}
