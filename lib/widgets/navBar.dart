import 'package:flutter/material.dart';

AppBar navBar() {
  return AppBar(
    elevation: 0,
    title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
            child: Image.asset('assets/images/prueba.png'),
          ))
    ]),
  );
}
