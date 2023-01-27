import 'package:flutter/foundation.dart' show immutable;
import 'package:riverpod/riverpod.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

@immutable
class Todo {
  final String id;
  final String description;
  final bool completed;

  const Todo({required this.description, required this.id, this.completed = false});

  @override
  String toString() {
    return 'Todo(description: $description, completed: $completed)';
  }
}

class TodoList extends StateNotifier<List<Todo>> {
  TodoList([List<Todo>? initialTodos]) : super(initialTodos ?? []);

  void add(String description) => state = [...state, Todo(id: _uuid.v4(), description: description)];
  void edit({required String id, required String descripton}) => state = [
    for (final todo in state)
      if (todo.id == id)
        Todo(id: todo.id, completed: todo.completed, description: todo.description)
      else todo
  ];
  
  void toggle(String id) => state = [
    for (final todo in state)
      if (todo.id == id)
        Todo(id: todo.id, completed: !todo.completed, description: todo.description) 
      else todo
  ];
  void remove(Todo target) => state = state.where((todo) => todo.id != target.id).toList();
}
