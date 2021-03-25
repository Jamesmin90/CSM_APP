import 'package:flutter/cupertino.dart';

class Todo {
  String title;
  String id;
  String description;
  bool isDone;
  Todo({
    @required this.title,
    this.description = '',
    this.id,
    this.isDone = false,
  });

  static Todo fromJson(Map<String, dynamic> json) => Todo(
        title: json['title'],
        description: json['description'],
        id: json['id'],
        isDone: json['isDone'],
      );
}
