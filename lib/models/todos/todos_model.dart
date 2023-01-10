import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'todos_model.g.dart';

abstract class TodosModel
    implements Built<TodosModel, TodosModelBuilder> {
  BuiltList<TodosResults> get results;

  TodosModel._();

  factory TodosModel([updates(TodosModelBuilder b)]) =
  _$TodosModel;
  static Serializer<TodosModel> get serializer =>
      _$todosModelSerializer;
}

abstract class TodosResults
    implements Built<TodosResults, TodosResultsBuilder> {
  int get userId;
  int get id;
  String get title;
  bool get completed;


  TodosResults._();
  factory TodosResults([updates(TodosResultsBuilder b)]) =
  _$TodosResults;
  static Serializer<TodosResults> get serializer =>
      _$todosResultsSerializer;
}