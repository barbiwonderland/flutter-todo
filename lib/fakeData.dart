import 'package:flutter_application_1/models/todo.dart';


List<ToDo> todoList() {
  return [
    ToDo(id: '01', todoText: 'Morning Excercise', isDone: true),
    ToDo(id: '02', todoText: 'Buy Groceries', isDone: true),
    ToDo(
      id: '03',
      todoText: 'Check Emails',
    ),
    ToDo(
      id: '04',
      todoText: 'Team Meeting',
    ),
    ToDo(
      id: '05',
      todoText: 'Work on mobile apps for 2 hour',
    ),
    ToDo(
      id: '06',
      todoText: 'Dinner with Jenny',
    ),
  ];
}
