import "dart:core";

class TodoModel {
  final int userId;
  final int id;
  final String title;
  final bool completed;


  TodoModel(
      this.userId,
      this.id,
      this.title,
      this.completed,

      );


  @override
  int get hashCode => super.hashCode;
}

List<TodoModel> Todo = TodosData.map((e) => TodoModel(
  e['userId'] as int,
  e['id'] as int,
  e['title'] as String,
  e['completed'] as bool,

)).toList();

var TodosData = [];
