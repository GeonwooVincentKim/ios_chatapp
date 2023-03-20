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
    
      print("Get UserID -> ${user.userId}");
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
        backgroundColor: user.color,
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.create, color: white70),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed("/call/update/${user.userId}");
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
                      const Divider(
                        color: Colors.transparent,
                        height: 35,
                        thickness: 5,
                        indent: 20,
                        endIndent: 40,
                      ),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: GestureDetector(
                    onTap: () {
                      Provider.of<UserProvider>(context, listen: false).deleteUser(user);
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height * 0.1),
                      alignment: Alignment.center,
                      color: red,
                      child: const Text("Delete", style: TextStyle(fontSize: 25, color: CupertinoColors.systemGrey5))
                    ),
                  ),
                )
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
  }

  Widget _buildProfileBackground(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            user.oppositeColor,
            user.color
          ]
        )
      ),
    );
  }
}
