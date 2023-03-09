import 'package:flutter_application_1/fakeData.dart';
import 'package:flutter_application_1/models/todo.dart';

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<ToDo>> fetchData() async {
  List<ToDo> jsonData;
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

  if (response.statusCode == 200) {
    var res = jsonDecode(response.body) as List;

  
    // devuelve una nueva lista...
    //traversing through each value in the key value arrangement of the json
    jsonData = res.map<ToDo>((json) => ToDo.fromJson(json)).toList();
    return jsonData;
  } else {
    throw Exception('Failed to load data');
  }
}
