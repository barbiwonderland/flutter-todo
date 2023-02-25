import 'package:flutter/material.dart';

Widget searchBox(BuildContext context, filterTodo) {
  return Stack(
    children: [
      Container(
          height: 50,
          margin: EdgeInsets.only(top: 15),
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: TextField(
              textAlignVertical: TextAlignVertical.center,
              onChanged: (value) {
                filterTodo(value);
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.blueGrey,
                  size: 20,
                ),
                prefixIconConstraints:
                    BoxConstraints(maxHeight: 20, minWidth: 25),
                border: InputBorder.none,
                hintText: "Buscar",
                hintStyle: TextStyle(color: Colors.grey),
              )))
    ],
  );
}
