import 'package:flutter/material.dart';
import 'package:ios_chatapp/feature_riverpod/todo_list/data/sample_todolist_data.dart';
import 'package:riverpod/riverpod.dart';
import 'package:ios_chatapp/feature_riverpod/todo_list/riverpod_todo.dart';

final addToKey = UniqueKey();
final activeFilterKey = UniqueKey();
final completedFilterKey = UniqueKey();
final allFilterKey = UniqueKey();

final todoListProvider = StateNotifierProvider<TodoList, List<Todo>>((ref) => TodoList(todoList));

enum TodoListFilter { all, active, completed }
final todoListFilter = StateProvider((ref) => TodoListFilter.all);
final uncompletedTodosCount = Provider<int>((ref) => ref.watch(todoListProvider).where((todo) => !todo.completed).length);

final filteredTodos = Provider<List<Todo>>((ref) {
  final filter = ref.watch(todoListFilter);
  final todos = ref.watch(todoListProvider);

  switch (filter) {
    case TodoListFilter.completed:  return todos.where((todo) => todo.completed).toList();
    case TodoListFilter.active:  return todos.where((todo) => !todo.completed).toList();
    case TodoListFilter.all:  return todos;
  }
});
