import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ios_chatapp/model/users.dart';
import 'package:ios_chatapp/shared/style.dart';
import 'package:ios_chatapp/widgets/cupertino_scroll_view/custom_single_child_scrollview.dart';

class CustomDraggableScrollableSheet extends StatelessWidget {
  const CustomDraggableScrollableSheet({
    super.key,
    required this.selectedUser,
  });

  final User? selectedUser;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      minChildSize: scrollableBarChild,
      initialChildSize: scrollableBarChild,
      builder:(context, scrollController) {
        return CustomSingleChildScrollView(selectedUser: selectedUser);
      },
    );
  }
}
