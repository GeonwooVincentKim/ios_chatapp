import 'package:ios_chatapp/feature_riverpod/new_todo_list/filters/riverpod_filters.dart';

TodoListFilter filterButtonState(textContents) {
  if (textContents == "Active") {
    return TodoListFilter.active;
  } else if (textContents == "All") {
    return TodoListFilter.all;
  } else if (textContents == "Completed") {
    return TodoListFilter.completed;
  } else {
    return TodoListFilter.active; 
  }
}