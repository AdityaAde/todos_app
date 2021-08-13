import 'package:flutter/cupertino.dart';

class TodoField {
  static const createdTime = 'createdTime';
}

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
}
