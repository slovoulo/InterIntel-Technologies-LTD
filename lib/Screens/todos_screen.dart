import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants.dart';
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
  bool isBusy = true;
  @override
  void initState() {
    // TODO: implement initState
    fetchAllTodos();
    super.initState();
  }

  Future<TodosResults?> fetchAllTodos() async {
    TodosResults? todosResults;
    final response = await dioFetchService().fetchTodos();

    try {
      TodosData.clear();

      for (var result in json.decode(json.encode(response.data))) {
        todosResults =
            serializers.deserializeWith(TodosResults.serializer, result);

        TodosData.addAll([
          {
            "userId": todosResults!.userId,
            "id": todosResults.id,
            "title": "${todosResults.title}",
            "completed": todosResults.completed,
          },
        ]);
        //
        Todo = TodosData.map((e) => TodoModel(
              e['userId'],
              e['id'],
              e['title'] as String,
              e['completed'],
            )).toList();
      }
    } catch (e) {
      print("the error is $e");
      todosResults = null;
    }

    Fluttertoast.showToast(msg: 'Operation successful');
    setState(() => isBusy = false);

    return todosResults;
  }

  todosContainer(String title, bool completed) {
    return Material(elevation: 20,borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.all(15),
        height: MediaQuery.of(context).size.height * 0.12,
        decoration: BoxDecoration(


          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height:MediaQuery.of(context).size.height * 0.15 , width: 5,
            decoration: BoxDecoration(color: completed ?kPrimaryColor:kLogoutRed,borderRadius: BorderRadius.circular(5)),),
            SizedBox(width: 10,),
            Expanded(
              child: Column(
                children: [
                  Align(alignment: Alignment.topLeft,
                    child: Text(
                      title,
                      style: kBoldBlackTextStyle(15),
                    ),
                  ),

                  Flexible(
                    child: Align( 
                        alignment: Alignment.bottomRight,
                        child: Text(completed ? "Completed🏅" : "Pending😞")),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  fetchingTodos() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SpinKitChasingDots(
            color: kPrimaryColor, duration: Duration(seconds: 1), size: 35),
        Text("Fetching data")
      ],
    );
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: kPrimaryColorLighter,
            title: Text("Todos"),
          ),
          body:
      Visibility(
    visible: isBusy ? false : true,
    replacement: fetchingTodos(),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height:12);
        },
        itemCount: Todo.length,
        itemBuilder: (context, index) {
          return todosContainer(Todo[index].title, Todo[index].completed);
        },
      ),
    ),));


  }
}


