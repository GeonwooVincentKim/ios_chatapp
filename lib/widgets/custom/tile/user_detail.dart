import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ios_chatapp/model/users.dart';
import 'package:ios_chatapp/provider/user_provider.dart';
import 'package:ios_chatapp/shared/style.dart';
import 'package:ios_chatapp/widgets/detail/custom_clip_r_rect.dart';
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
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.pageId),
        backgroundColor: deepPurpleAccent,
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.create, color: white70),
          onPressed: () {
            Navigator.of(context).pushNamed("/call/update");
          },
          // onPressed: () => Navigator.pop(context),
        ),
      ),
      // navigationBar: CupertinoNavigationBar(middle: Text(widget.pageId), backgroundColor: blueAccent),
      child: Container(
        alignment: Alignment.center,
        color: CupertinoColors.systemGroupedBackground,
        child: Stack(
          alignment: Alignment.center,
          children: [
            _buildProfileBackground(context),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.25),
                  child: Column(
                    children: [
                      CustomClipRRect(user: user, description: "Name", customHeight: 0.13),
                      const Divider(
                        color: Colors.transparent,
                        height: 10,
                        thickness: 5,
                        indent: 20,
                        endIndent: 40,
                      ),
                      CustomClipRRect(user: user, description: "Phone Number", customHeight: 0.15),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.2,
              child: CircleAvatar(
                backgroundColor: user.color, 
                radius: 30,
                child: ClipOval(
                  child: Image.asset(
                    "assets/image/user/sample_user.png",
                    fit: BoxFit.cover
                  )
                )
              ),
            ),
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

  Widget _buildProfileBackground(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            blue,
            purple
          ]
        )
      ),
    );
  }
}
