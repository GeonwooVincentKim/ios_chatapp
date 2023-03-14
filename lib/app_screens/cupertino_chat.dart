import 'package:flutter/cupertino.dart';
import 'package:ios_chatapp/model/users.dart';
import 'package:ios_chatapp/provider/user_provider.dart';
import 'package:ios_chatapp/widgets/custom/tile/chat_tile.dart';

class CupertinoChat extends StatefulWidget {
  final String textLocation;
  const CupertinoChat({super.key, required this.textLocation});

  @override
  State<CupertinoChat> createState() => _CupertinoChatState();
}

class _CupertinoChatState extends State<CupertinoChat> {
  List<User> userList = List.empty(growable: true);
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    /*
      feature-ios
      
      _controller = TextEditingController();
    */
    
    // master Branch
    userList = UserProvider().filteredUsers;
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateUserList(String value) {
    debugPrint(value);

    if (value.isNotEmpty) {
      userList  = userList 
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    } else {
      _controller.text = '';
      userList = userList ;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            // largeTitle: Text('Friends')
            largeTitle: Text(widget.textLocation)
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 5,
            ),
            delegate: SliverChildBuilderDelegate((context, index) => ChatTile(findUser: userList[index])),
          )
          // CupertinoSliverGrid(userList: userList),
        ],
      )
    );
  }
}
