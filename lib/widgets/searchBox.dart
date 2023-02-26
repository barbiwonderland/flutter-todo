import 'package:flutter/material.dart';

Widget searchBox(BuildContext context, filterTodo) {
  return Row(
   mainAxisAlignment: MainAxisAlignment.center,
   crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
         // height: 30,
          margin: EdgeInsets.only(top: 15),
          padding: EdgeInsets.all(5),
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255), borderRadius: BorderRadius.circular(20)),
          
            child:
           TextField(
              maxLines: 1,
              textAlignVertical: TextAlignVertical.center,
              onChanged: (value) {
                filterTodo(value);
              },
              decoration: InputDecoration(
               contentPadding: EdgeInsets.all(15),   
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
              )) ,) ,  
             
    ],
  );
}
