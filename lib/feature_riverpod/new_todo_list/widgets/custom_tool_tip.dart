import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ios_chatapp/feature_riverpod/new_todo_list/filters/riverpod_filters.dart';
import 'package:ios_chatapp/feature_riverpod/new_todo_list/shared/util.dart';

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
