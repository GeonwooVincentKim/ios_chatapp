import 'package:flutter/cupertino.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:ios_chatapp/model/users.dart';
import 'package:ios_chatapp/provider/user_provider.dart';
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
      navigationBar: CupertinoNavigationBar(middle: Text(widget.textLocation)),
      child: Center(
        child: Consumer<UserProvider>(
          builder: ((context, userElement, child) {
            final List<User> listUser = userElement.filteredUsers;
            getUserList = listUser.toList();

            return ListView.builder(
              shrinkWrap: true,
              itemCount: getUserList.length,
              itemBuilder: (context, index) {
                final item = getUserList[index];
                return CupertinoListTile(
                  title: Text(item.name),
                  onTap: () async {
                    // ignore: deprecated_member_use
                    launch('tel://${item.phoneNumber}');
                    await FlutterPhoneDirectCaller.callNumber(item.phoneNumber);
                  }
                );
              },
            );
          }),
        )
      ),
    );
  }
}
