import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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

bool useIsFocused(FocusNode node) {
  final isFocused = useState(node.hasFocus);

  useEffect(
    () {
      void listener() {
        isFocused.value = node.hasFocus;
      }

      node.addListener(listener);
      return () => node.removeListener(listener);
    },
    [node],
  );

  return isFocused.value;
}