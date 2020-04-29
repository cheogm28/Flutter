import 'package:flutter/foundation.dart';

class Item {
  final int id;
  final String body;
  final bool completed;

  Item({@required this.id, @required this.body, this.completed = false});

  Item copyWith({int id, String body, bool completed}) {
    return Item(id: id ?? this.id, body: body ?? this.body, completed: completed ?? this.completed);
  }

  Item.fromJson(Map json)
      : body = json["body"],
        id = (json["id"] as int),
        completed = (json["completed"] as bool);

  Map toJson() {
    return {"id": (id), "body": body, "completed": completed};
  }

@override
String toString(){
  return "$body,$id,$completed";
}

}

// representa el state del app completo
@immutable
class AppState {
  final List<Item> items;

  AppState({@required this.items});

  AppState.initialState() : items = List.unmodifiable(<Item>[]);
  factory AppState.initial() => AppState(items: List.unmodifiable([]));

  AppState.fromJson(Map json)
      : items =
            (json["items"] as List).map((item) => Item.fromJson(item)).toList();

  Map toJson() => {"items": items};
}
