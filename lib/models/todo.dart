import 'package:flutter_application_1/widgets/todoitem.dart';

class ToDo {
  int id;
  String todoText;
  bool isDone;
  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });


  factory ToDo.fromJson(Map<String, dynamic> json) {
    return ToDo(
      id: json['id'],
      todoText: json['title'],
      isDone: json['completed'],
    );
  }
}
