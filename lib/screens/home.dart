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
            Align(
                child: SizedBox(
              width: 800,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Agregar una tarea',

                  filled: true,
                  fillColor: Colors.white, //<-- SEE HERE
                ),
              ),
            )),
          ],
        ));
  }
}
