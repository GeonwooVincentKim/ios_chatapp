import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ios_chatapp/feature_riverpod/new_todo_list/filters/riverpod_filters.dart';

class Toolbar extends HookConsumerWidget {
  const Toolbar({
    Key? key,
  }) : super(key: key);

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
          Tooltip(
            key: allFilterKey,
            message: 'All todos',
            child: TextButton(
              onPressed: () =>
                  ref.read(todoListFilter.notifier).state = TodoListFilter.all,
              style: ButtonStyle(
                visualDensity: VisualDensity.compact,
                foregroundColor:
                    MaterialStateProperty.all(textColorFor(TodoListFilter.all)),
              ),
              child: const Text('All'),
            ),
          ),
          CustomToolTip(getKey: activeFilterKey, ref: ref, textColor: textColorFor(filterButtonState("Active")), textContents: "Active"),
          Tooltip(
            key: completedFilterKey,
            message: 'Only completed todos',
            child: TextButton(
              onPressed: () => ref.read(todoListFilter.notifier).state =
                  TodoListFilter.completed,
              style: ButtonStyle(
                visualDensity: VisualDensity.compact,
                foregroundColor: MaterialStateProperty.all(
                  textColorFor(TodoListFilter.completed),
                ),
              ),
              child: const Text('Completed'),
            ),
          ),
        ],
      ),
    );
  }
}

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

class CustomToolTip extends StatelessWidget {
  final UniqueKey getKey;
  final WidgetRef ref;
  final Color? textColor;
  final String textContents;

  const CustomToolTip({
    super.key,
    required this.getKey,
    required this.ref,
    required this.textColor,
    required this.textContents,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      key: getKey,
      message: 'Only uncompleted todos',
      child: TextButton(
        onPressed: () => ref.read(todoListFilter.notifier).state =
            filterButtonState(textContents),
        style: ButtonStyle(
          visualDensity: VisualDensity.compact,
          foregroundColor: MaterialStateProperty.all(
            // textColorFor(TodoListFilter.active),
            textColor
            // filterButtonState(textContents) as Color?
          ),
        ),
        child: Text(textContents),
      ),
    );
  }
}
