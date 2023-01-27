import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ios_chatapp/feature_riverpod/new_todo_list/filters/riverpod_filters.dart';
import 'package:ios_chatapp/feature_riverpod/new_todo_list/shared/util.dart';
import 'package:ios_chatapp/feature_riverpod/new_todo_list/widgets/custom_tool_tip.dart';

class Toolbar extends HookConsumerWidget {
  const Toolbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(todoListFilter);

    Color? textColorFor(TodoListFilter value) {
      return filter == value ? Colors.blue : Colors.black;
    }

    return Material(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              '${ref.watch(uncompletedTodosCount)} items left',
              overflow: TextOverflow.ellipsis,
            ),
          ),
          CustomToolTip(
            getKey: allFilterKey,
            message: "All todos",
            ref: ref,
            textColor: textColorFor(filterButtonState("All")),
            textContents: "All",
          ),
          CustomToolTip(
            getKey: activeFilterKey, 
            message: "Only uncompleted todos", 
            ref: ref, 
            textColor: textColorFor(filterButtonState("Active")), 
            textContents: "Active"
          ),
          CustomToolTip(
            getKey: completedFilterKey,
            message: "Only completed todos",
            ref: ref,
            textColor: textColorFor(filterButtonState("Completed")),
            textContents: "Completed"
          ),
        ],
      ),
    );
  }
}
