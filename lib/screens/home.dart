import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/fakeData.dart';
import 'package:flutter_application_1/models/todo.dart';
import 'package:flutter_application_1/widgets/todoitem.dart';
import 'package:flutter_application_1/widgets/searchBox.dart';

class Home extends StatefulWidget {
  //no entiendo estructura
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();

  // inicializo el estado con la lista estatica
  @override
  void initState() {
    _foundToDo = todosList;
    // ver
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 232, 227, 233),
        appBar: AppBar(
          elevation: 0,
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Icon(
              Icons.menu,
              color: Colors.white,
              size: 30,
            ),
            Text("To do app", style: TextStyle(color: Colors.white)),
            Container(
                height: 40,
                width: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                      "https://hips.hearstapps.com/ellees.h-cdn.co/assets/15/37/1024x1332/1024x1332-por-ti-rostros-activos-personas-luchadoras-12718597-1-esl-es-rostros-activos-personas-luchadoras-jpg.jpg?resize=480:*"),
                ))
          ]),
        ),
        body: Column(
          children: [
            searchBox(context, _filterTodo),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20.0),
                children: <Widget>[
                  for (ToDo item in _foundToDo)
                    (TodoItem(
                      todo: item,
                      onToDoChanged: _hanleTodoChange,
                      onDeleteItem: _handleDelete,
                    )),
                ],
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(0),
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: TextField(
                    //de aca se obtiene lo que escribe el usuario
                    controller: _todoController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 25),
                      labelText: 'Agregar una tarea',
                      prefixIconConstraints:
                          BoxConstraints(maxHeight: 20, minWidth: 25),
                      //elimina la linea de abajo del input
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10, bottom: 5),
                child: FloatingActionButton(
                  onPressed: () {
                    _addToDo(_todoController.text);
                  },
                  backgroundColor: Colors.cyan,
                  child: const Icon(Icons.bookmark_add, color: Colors.white),
                ),
              )
            ])
          ],
        ));
  }

  void _hanleTodoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _handleDelete(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDo(String toDo) {
    setState(() {
      todosList.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoText: toDo,
      ));
    });
    _todoController.clear();
  }

  void _filterTodo(String keyWord) {
    List<ToDo> results = [];
    if (keyWord.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((todo) =>
              (todo.todoText.toLowerCase()).contains(keyWord.toLowerCase()))
          // lo convierto en una lista
          .toList();
    }
    setState(() {
      _foundToDo = results;
    });
  }
}
