import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ios_chatapp/feature_riverpod/new_todo_list/filters/riverpod_filters.dart';
import 'package:ios_chatapp/feature_riverpod/new_todo_list/shared/util.dart';

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

class CustomToolTip extends StatelessWidget {
  final UniqueKey getKey;
  final String message;
  final WidgetRef ref;
  final Color? textColor;
  final String textContents;

  const CustomToolTip({
    super.key,
    required this.getKey,
    required this.message,
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
          foregroundColor: MaterialStateProperty.all(textColor),
        ),
        child: Text(textContents),
      ),
    );
  }
}
