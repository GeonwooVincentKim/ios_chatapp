import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:ios_chatapp/model/users.dart';
import 'package:ios_chatapp/provider/user_provider.dart';
import 'package:ios_chatapp/shared/style.dart';
import 'package:ios_chatapp/widgets/custom/tile/user_detail.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CupertinoCall extends StatefulWidget {
  final String textLocation; 
  const CupertinoCall({super.key, required this.textLocation});

  @override
  State<CupertinoCall> createState() => _CupertinoCallState();
}

class _CupertinoCallState extends State<CupertinoCall> {
  List<User> getUserList = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.textLocation),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.add),
          onPressed: () {
            Navigator.of(context).pushNamed("/call/add");
          },
          // onPressed: () => Navigator.pop(context),
        ),
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Consumer<UserProvider>(
              //   builder: ((context, personalUser, child) {

              //   }),
              // ),
              // Consumer2(
              //   builder: (context, value, value2, child) {
                
              //   },
              // ),
              Consumer<UserProvider>(
                builder: ((context, userElement, child) {
                  final List<User> listUser = userElement.userList;
                  getUserList = listUser.toList();
                  
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: getUserList.length,
                    itemBuilder: (context, index) {
                      final item = getUserList[index];
                  
                      return CupertinoListTile(
                        title: Text(item.name),
                        subtitle: Text(item.phoneNumber),
                        leading: CircleAvatar(
                          backgroundColor: item.color,
                          radius: 30,
                          child: ClipOval(
                            child: Image.asset(
                              "assets/image/user/sample_user.png",
                              fit: BoxFit.cover
                            ),
                          )
                        ),
                        onTap: () {
                          print("Here?");
                          Provider.of<UserProvider>(context, listen: false).selectUser(item);
                          Navigator.pushNamed(context, "/call/detail/${item.userId}");
                          // UserDetail(user: item);
                        },
                        trailing: TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(color: blue)
                            )
                          ),
                          child: const Text('Call'),
                          onPressed: () async {
                            // ignore: deprecated_member_use
                            launch('tel://${item.phoneNumber}');
                            await FlutterPhoneDirectCaller.callNumber(item.phoneNumber);
                          },
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        )
      ),
    );
  }
}
