import 'package:flutter/cupertino.dart';
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
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BoxColumnText(innerText: selectedUser!.name, checkTextIsTitle: true),
                BoxColumnText(innerText: "Oh Happy Day~", checkTextIsTitle: false),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05, 
                    // bottom: MediaQuery.of(context).size.height * 0.2
                  )
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    foregroundColor: Colors.black87,
                    backgroundColor: Colors.white70
                  ),
                  child: const Icon(CupertinoIcons.pencil, color: black26),
                  onPressed: () {
                    // Navigator.pushNamed(context, "/")
                  },
                )
              ],
            )
          ],
        ),
      )
    );
  }
}