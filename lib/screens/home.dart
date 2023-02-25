import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/fakeData.dart';
import 'package:flutter_application_1/models/todo.dart';
import 'package:flutter_application_1/widgets/todoitem.dart';
import 'package:flutter_application_1/widgets/searchBox.dart';

class Home extends StatelessWidget {
  //no entiendo estructura
  Home({Key? key}) : super(key: key);

  final todosList = todoList();

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
            searchBox(context),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(20.0),
                children: <Widget>[
                  for (ToDo item in todosList) (TodoItem(todo: item)),
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
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 25),
                      labelText: 'Agregar una tarea',
                      floatingLabelAlignment: FloatingLabelAlignment.center,
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
                    // Add your onPressed code here!
                  },
                  backgroundColor: Colors.cyan,
                  child: const Icon(Icons.bookmark_add, color: Colors.white),
                ),
              )
            ])
          ],
        ));
  }
}
