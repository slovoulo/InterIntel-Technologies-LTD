// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TodosModel> _$todosModelSerializer = new _$TodosModelSerializer();
Serializer<TodosResults> _$todosResultsSerializer =
    new _$TodosResultsSerializer();

class _$TodosModelSerializer implements StructuredSerializer<TodosModel> {
  @override
  final Iterable<Type> types = const [TodosModel, _$TodosModel];
  @override
  final String wireName = 'TodosModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, TodosModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'results',
      serializers.serialize(object.results,
          specifiedType:
              const FullType(BuiltList, const [const FullType(TodosResults)])),
    ];

    return result;
  }

  @override
  TodosModel deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TodosModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'results':
          result.results.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(TodosResults)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$TodosResultsSerializer implements StructuredSerializer<TodosResults> {
  @override
  final Iterable<Type> types = const [TodosResults, _$TodosResults];
  @override
  final String wireName = 'TodosResults';

  @override
  Iterable<Object?> serialize(Serializers serializers, TodosResults object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'userId',
      serializers.serialize(object.userId, specifiedType: const FullType(int)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'completed',
      serializers.serialize(object.completed,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  TodosResults deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TodosResultsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'completed':
          result.completed = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$TodosModel extends TodosModel {
  @override
  final BuiltList<TodosResults> results;

  factory _$TodosModel([void Function(TodosModelBuilder)? updates]) =>
      (new TodosModelBuilder()..update(updates))._build();

  _$TodosModel._({required this.results}) : super._() {
    BuiltValueNullFieldError.checkNotNull(results, r'TodosModel', 'results');
  }

  @override
  TodosModel rebuild(void Function(TodosModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TodosModelBuilder toBuilder() => new TodosModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TodosModel && results == other.results;
  }

  @override
  int get hashCode {
    return $jf($jc(0, results.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TodosModel')..add('results', results))
        .toString();
  }
}

class TodosModelBuilder implements Builder<TodosModel, TodosModelBuilder> {
  _$TodosModel? _$v;

  ListBuilder<TodosResults>? _results;
  ListBuilder<TodosResults> get results =>
      _$this._results ??= new ListBuilder<TodosResults>();
  set results(ListBuilder<TodosResults>? results) => _$this._results = results;

  TodosModelBuilder();

  TodosModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _results = $v.results.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TodosModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TodosModel;
  }

  @override
  void update(void Function(TodosModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TodosModel build() => _build();

  _$TodosModel _build() {
    _$TodosModel _$result;
    try {
      _$result = _$v ?? new _$TodosModel._(results: results.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'results';
        results.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TodosModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$TodosResults extends TodosResults {
  @override
  final int userId;
  @override
  final int id;
  @override
  final String title;
  @override
  final bool completed;

  factory _$TodosResults([void Function(TodosResultsBuilder)? updates]) =>
      (new TodosResultsBuilder()..update(updates))._build();

  _$TodosResults._(
      {required this.userId,
      required this.id,
      required this.title,
      required this.completed})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(userId, r'TodosResults', 'userId');
    BuiltValueNullFieldError.checkNotNull(id, r'TodosResults', 'id');
    BuiltValueNullFieldError.checkNotNull(title, r'TodosResults', 'title');
    BuiltValueNullFieldError.checkNotNull(
        completed, r'TodosResults', 'completed');
  }

  @override
  TodosResults rebuild(void Function(TodosResultsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TodosResultsBuilder toBuilder() => new TodosResultsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TodosResults &&
        userId == other.userId &&
        id == other.id &&
        title == other.title &&
        completed == other.completed;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, userId.hashCode), id.hashCode), title.hashCode),
        completed.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TodosResults')
          ..add('userId', userId)
          ..add('id', id)
          ..add('title', title)
          ..add('completed', completed))
        .toString();
  }
}

class TodosResultsBuilder
    implements Builder<TodosResults, TodosResultsBuilder> {
  _$TodosResults? _$v;

  int? _userId;
  int? get userId => _$this._userId;
  set userId(int? userId) => _$this._userId = userId;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  bool? _completed;
  bool? get completed => _$this._completed;
  set completed(bool? completed) => _$this._completed = completed;

  TodosResultsBuilder();

  TodosResultsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _id = $v.id;
      _title = $v.title;
      _completed = $v.completed;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TodosResults other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TodosResults;
  }

  @override
  void update(void Function(TodosResultsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TodosResults build() => _build();

  _$TodosResults _build() {
    final _$result = _$v ??
        new _$TodosResults._(
            userId: BuiltValueNullFieldError.checkNotNull(
                userId, r'TodosResults', 'userId'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'TodosResults', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'TodosResults', 'title'),
            completed: BuiltValueNullFieldError.checkNotNull(
                completed, r'TodosResults', 'completed'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
