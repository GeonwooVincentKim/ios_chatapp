import 'package:flutter/cupertino.dart';
import 'package:ios_chatapp/model/users.dart';
import 'package:ios_chatapp/shared/style.dart';

class CustomClipRRect extends StatelessWidget {
  final User user;
  final String description;
  final double customHeight;

  const CustomClipRRect({
    super.key,
    required this.user,
    required this.description,
    required this.customHeight
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: MediaQuery.of(context).size.height * customHeight,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
        alignment: Alignment.center,
        color: deepPurpleAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(description, style: const TextStyle(fontSize: 18, color: CupertinoColors.systemGrey)),
            Text(description == "Name" ? user.name : user.phoneNumber, style: const TextStyle(fontSize: 25, color: CupertinoColors.systemGrey5))
          ],
        )
      )
    );
  }
}
