import 'package:flutter/material.dart';
import 'package:ios_chatapp/model/users.dart';
import 'package:ios_chatapp/shared/style.dart';
import 'package:ios_chatapp/widgets/column/box_column_text.dart';


class CustomSingleChildScrollView extends StatelessWidget {
  const CustomSingleChildScrollView({
    super.key,
    required this.selectedUser,
  });

  final User? selectedUser;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      // controller: scrollController,
      child: Container(
        constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
        color: Colors.amber,
        padding: const EdgeInsets.only(top: profileCircleAvatar),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BoxColumnText(innerText: selectedUser!.name, checkTextIsTitle: true),
            BoxColumnText(innerText: "Oh Happy Day~", checkTextIsTitle: false),
          ],
        ),
      )
    );
  }
}