import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ios_chatapp/model/users.dart';
import 'package:ios_chatapp/shared/style.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GestureDetector(
        onTap:() {
          Navigator.pushNamed(context, "/profile/${user.userId}");
        },
        child: Container(
          margin: const EdgeInsets.all(defaultPadding - 10),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: user.color, 
                radius: 30,
                child: ClipOval(
                  child: Image.asset(
                    "assets/image/user/sample_user.png",
                    fit: BoxFit.cover
                  )
                )
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start, 
                children: [
                  Text(
                    user.name,
                    style: const TextStyle(color: CupertinoColors.black, fontSize: 25)
                  )
                ]
              )
            ]
          )
        )
      )
    );
  }
}
