import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ios_chatapp/app_screens/chat/other_user_profile.dart';
import 'package:ios_chatapp/model/users.dart';
import 'package:ios_chatapp/provider/user_provider.dart';
import 'package:ios_chatapp/shared/style.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  final User findUser;

  const UserTile({super.key, required this.findUser});

  @override
  Widget build(BuildContext context) {
    print('CheckCheck');
    return GestureDetector(
      onTap:() {
        Provider.of<UserProvider>(context, listen: false).selectUser(findUser);
        Navigator.pushNamed(context, "/user/${findUser.userId}");
      },
      child: Container(
        margin: const EdgeInsets.all(defaultPadding - 10),
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: findUser.color, 
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
                  findUser.name,
                  style: const TextStyle(color: CupertinoColors.black, fontSize: 25)
                )
              ]
            )
          ]
        )
      ),
    );
    // return GestureDetector(
    //   behavior: HitTestBehavior.opaque,
    //   onTap:() {
    //     Provider.of<UserProvider>(context, listen: false).selectUser(user);
    //     // Navigator.of(context).push(
    //     //   CupertinoPageRoute(builder: (context) => OtherUserProfile(userId: user.userId))
    //     // );
    //     Navigator.pushNamed(context, "/profile");
    //     print("Context -> ${user.userId}");
    //     // Navigator.pushNamed(context, "/${user.userId}");
    //     // Navigator.pushNamed(context, "/profile");
    //   },
    //   child: Container(
    //     margin: const EdgeInsets.all(defaultPadding - 10),
    //     width: MediaQuery.of(context).size.width,
    //     child: Row(
    //       children: [
    //         CircleAvatar(
    //           backgroundColor: user.color, 
    //           radius: 30,
    //           child: ClipOval(
    //             child: Image.asset(
    //               "assets/image/user/sample_user.png",
    //               fit: BoxFit.cover
    //             )
    //           )
    //         ),
    //         const SizedBox(width: 20),
    //         Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text(
    //               user.name,
    //               style: const TextStyle(color: CupertinoColors.black, fontSize: 25)
    //             )
    //           ]
    //         )
    //       ]
    //     )
    //   )
    // );
  }
}
