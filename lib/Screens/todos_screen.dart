import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../dioFetchService.dart';
import '../models/serializers/serializers.dart';
import '../models/todos/todosModel.dart';
import '../models/todos/todos_model.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({Key? key}) : super(key: key);

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  @override
  void initState() {
    // TODO: implement initState
    fetchAllTodos();
    super.initState();
  }

  Future<TodosResults?> fetchAllTodos() async {
    TodosResults? todosResults;

    try {
      //TodosData.clear();

      final response = await dioFetchService().fetchTodos();


      for (var result in json.decode(response.toString())["results"]) {
        print("todosResults is $result");
       todosResults = serializers.deserializeWith(TodosResults.serializer, result);


        TodosData.addAll([
          {
            "userId": "${todosResults!.userId}",
            "id": "${todosResults.id}",
            "title": "${todosResults.title}",
            "completed": "${todosResults.completed}",

          },
        ]);

        Todo = TodosData.map((e) => TodoModel(
          e['userId']as int ,
          e['id'] as int,
          e['title'] as String,
          e['completed'] as bool,
        )).toList();

      }
    } catch (e) {
      print("the error is $e");
      todosResults = null;
    }

    print("got todos $todosResults");

    return todosResults;
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
