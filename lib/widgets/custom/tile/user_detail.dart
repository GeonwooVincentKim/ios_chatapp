import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ios_chatapp/model/users.dart';
import 'package:ios_chatapp/provider/user_provider.dart';
import 'package:ios_chatapp/shared/style.dart';
import 'package:provider/provider.dart';

class UserDetail extends StatefulWidget {
  final String pageId;
  const UserDetail({super.key, required this.pageId});

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  late User user;

  @override
  void initState() {
    setState(() {
      user = Provider.of<UserProvider>(context, listen: false).getSingleUser!;  
    });

    if (user == null) {
      final List<User> userList = Provider.of<UserProvider>(context, listen: false).userList.toList();
      user = userList.firstWhere((element) => element.userId == widget.pageId);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text(widget.pageId)),
      child: Container(
        alignment: Alignment.center,
        color: CupertinoColors.systemGroupedBackground,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(user.name),
            Text(user.phoneNumber)
          ],
        )
      ),
    );
  //  return GestureDetector(
  //     behavior: HitTestBehavior.opaque,
  //     onTap:() {
  //       // Provider.of<UserProvider>(context, listen: false).selectUser(user);
  //       // Navigator.pushNamed(context, "/profile/${user.userId}");
  //     },
  //     child: Container(
  //       margin: EdgeInsets.all(defaultPadding + (MediaQuery.of(context).size.height * 0.2)),
  //       height: MediaQuery.of(context).size.height,
  //       child: Column(
  //         children: [
  //           CircleAvatar(
  //             backgroundColor: user.color, 
  //             radius: 30,
  //             child: ClipOval(
  //               child: Image.asset(
  //                 "assets/image/user/sample_user.png",
  //                 fit: BoxFit.cover
  //               )
  //             )
  //           ),
  //           const SizedBox(width: 20),
  //           Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 user.name,
  //                 style: const TextStyle(color: CupertinoColors.black, fontSize: 25)
  //               )
  //             ]
  //           )
  //         ]
  //       )
  //     ),
  //   );
  }
}
