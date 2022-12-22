import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ios_chatapp/model/users.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        child: Row(children: [
          CircleAvatar(backgroundColor: user.color, radius: 30),
          const SizedBox(width: 20),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(user.name,
                style:
                    const TextStyle(color: CupertinoColors.black, fontSize: 25))
          ])
        ]));
  }
}
