import 'package:flutter/cupertino.dart';
import 'package:ios_chatapp/model/users.dart';
import 'package:ios_chatapp/provider/user_provider.dart';
import 'package:ios_chatapp/shared/style.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  final String userInfo;
  const ChatPage({super.key, required this.userInfo});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late User chatUser;

  @override
  void initState() {
    setState(() => chatUser = Provider.of<UserProvider>(context, listen: false).getSingleUser!);

    if (chatUser == null) {
      final List<User> userList = Provider.of<UserProvider>(context, listen: false).filteredUsers;
      chatUser = userList.firstWhere((user) => user.userId == widget.userInfo);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(chatUser.name, style: const TextStyle(color: black87),),
        backgroundColor: white70,
      ),
      child: Container(
        child: Column(
          children: [
            Text('My Info is ${chatUser.name}'),
            Text('My color is ${chatUser.color}')
          ],
        ),
      )
    );
  }
}
