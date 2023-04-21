import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:ios_chatapp/model/message.dart';
import 'package:ios_chatapp/model/users.dart';
import 'package:ios_chatapp/provider/message_provider.dart';
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
  late Message message;

  List<Message> messages = [];
  final messageController = TextEditingController();

  @override
  void initState() {
    setState(() => chatUser = Provider.of<UserProvider>(context, listen: false).getSingleUser!);
    
    if (chatUser == null) {
      final List<User> userList = Provider.of<UserProvider>(context, listen: false).filteredUsers;
      chatUser = userList.firstWhere((user) => user.userId == widget.userInfo);
    }

    messages = Provider.of<MessageProvider>(context, listen: false).messageList; 

    print("Is here??????");

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
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text('My Info is ${chatUser.name}', style: TextStyle(color: CupertinoColors.black)),
              // Text('My color is ${chatUser.color}', style: TextStyle(color: CupertinoColors.black))
              Expanded(
                child: GroupedListView<Message, DateTime>(
                  padding: const EdgeInsets.all(8),
                  reverse: true,
                  order: GroupedListOrder.DESC,
                  useStickyGroupSeparators: true,
                  floatingHeader: true,
                  elements: messages,
                  groupBy: (message) => DateTime(
                    message.date.year,
                    message.date.month,
                    message.date.day
                  ),
                  groupHeaderBuilder: (Message message) => SizedBox(
                    height: 40,
                    child: Center(
                      child: Card(
                        color: CupertinoTheme.of(context).primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            DateFormat.yMMMd().format(message.date),
                            style: const TextStyle(color: Colors.white)
                          )
                        )
                      ),
                    )
                  ),
                  itemBuilder: (context, Message message) => Align(
                    alignment: message.isSendByMe
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                    child: Card(
                      elevation: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(message.text)
                      )
                    ),
                  )
                )
              ),
              // Expanded(child: Container()),
              Container(
                color: CupertinoColors.systemGrey3,
                child: CupertinoTextField(
                  padding: const EdgeInsets.all(12),
                  placeholder: "Type your message here...",
                  controller: messageController,
                  onSubmitted: (text) {
                    final message = Message(
                      text: text,
                      date: DateTime.now(),
                      isSendByMe: true
                    );

                    setState(() => messages.add(message));
                    messageController.clear();
                  },
                )
              )
            ],
          ),
        ),
      )
    );
  }
}
