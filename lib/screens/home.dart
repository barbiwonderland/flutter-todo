import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/fakeData.dart';
import 'package:flutter_application_1/models/todo.dart';
import 'package:flutter_application_1/widgets/todoitem.dart';
import 'package:flutter_application_1/widgets/searchBox.dart';
import 'package:flutter_application_1/widgets/navBar.dart';
class Home extends StatefulWidget {
  //no entiendo estructura
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // to do list deberia  llamarse en controller y que llame a una funcion en el modelo que haga la peticion a todoList?
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
        appBar: navBar(),
        body:  Column(
          children: [
            searchBox(context, _filterTodo),
             if (_foundToDo.isEmpty)
              Container(
              margin: EdgeInsets.only(top: 40),
              alignment: Alignment.center,
              child:Text("No se encontraron resultados..." ,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20,),) ,
              ) ,
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
    //edto iria en el modelo?
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDo(String toDo) {
    // aca si se actualizaria en un server si tendria que llamar a una funcion del controller que llame al modelo y que haga la modif?
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
