import 'package:flutter/cupertino.dart';

class Todo {
  String title;
  String id;
  String description;
  bool isDone;
  String name;
  Todo({
    @required this.title,
    this.name,
    this.description = '',
    this.id,
    this.isDone = false,
  });

  static Todo fromJson(Map<String, dynamic> json) => Todo(
        name: json['name'],
        title: json['title'],
        description: json['description'],
        id: json['id'],
        isDone: json['isDone'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'title': title,
        'description': description,
        'id': id,
        'isDone': isDone,
      };
}
