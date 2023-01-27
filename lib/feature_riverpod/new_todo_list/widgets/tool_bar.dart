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
          CustomToolTip(ref: ref, textColor: textColorFor(TodoListFilter.active), textContents: "Active"),
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

class CustomToolTip extends StatelessWidget {

  final WidgetRef ref;
  final Color? textColor;
  final String textContents;

  const CustomToolTip({
    super.key,
    required this.ref,
    required this.textColor,
    required this.textContents
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      key: activeFilterKey,
      message: 'Only uncompleted todos',
      child: TextButton(
        onPressed: () => ref.read(todoListFilter.notifier).state =
            newMethod,
        style: ButtonStyle(
          visualDensity: VisualDensity.compact,
          foregroundColor: MaterialStateProperty.all(
            // textColorFor(TodoListFilter.active),
            textColor
          ),
        ),
        child: Text(textContents),
      ),
    );
  }


  TodoListFilter get newMethod => TodoListFilter.active;
}