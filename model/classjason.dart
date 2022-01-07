/// without image jast name and id
class class_json_main_items {
  late String id;
  late String name;
  late List games;
  class_json_main_items({
    required this.id,
    required this.name,
    required this.games,
  });

  class_json_main_items.fromJson(Map<String, dynamic> map) {
    if (map['games'] != null) {
      games = map['games'];
    }
    id = map['_id'];
    name = map['name'];
  }
}
