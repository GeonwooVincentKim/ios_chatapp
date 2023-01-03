import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ios_chatapp/model/users.dart';
import 'package:ios_chatapp/provider/user_provider.dart';
import 'package:ios_chatapp/widgets/cupertino_scroll_view/cupertino_sliver_grid.dart';

class CupertinoChat extends StatefulWidget {
  const CupertinoChat(
      {super.key,
      required});

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
      // navigationBar: const CupertinoNavigationBar(
      //   middle: Text('Friends', style: TextStyle(color: Colors.black)),
      //   border: Border(bottom: BorderSide(color: Colors.transparent))
      // ),
      // appBar: const CupertinoNavigationBar(
      //   middle: Text('Friends', style: TextStyle(color: Colors.black)),
      //   border: Border(bottom: BorderSide(color: Colors.transparent)),
      //   // trailing: CupertinoButton(
      //   //   padding: EdgeInsets.zero,
      //   //   child: const Text('confirm', style: TextStyle(color: CupertinoColors.white)),
      //   //   onPressed: () {},
      //   // ),
      // ),
      // navigationBar: const CupertinoNavigationBar(
      //   middle: Text('Friends', style: TextStyle(color: CupertinoColors.opaqueSeparator)),
      //   border: Border(bottom: BorderSide(color: CupertinoColors.quaternarySystemFill))
      // ),
      child: CustomScrollView(
        slivers: [
          const CupertinoSliverNavigationBar(
            largeTitle: Text('Friends')
          ),
          // CupertinoSliverNavigationBar(
          //   backgroundColor: CupertinoColors.darkBackgroundGray,
          //   leading: CupertinoNavigationBarBackButton(
          //     onPressed: () {},
          //     color: CupertinoColors.activeBlue,
          //   ),
          //   middle: const Text('Friends', style: TextStyle(color: CupertinoColors.inactiveGray)),
          //   trailing: CupertinoButton(
          //     padding: EdgeInsets.zero,
          //     child: const Text("Confirm", style: TextStyle(color: CupertinoColors.activeBlue)),
          //     onPressed: () {},
          //   ),
          //   largeTitle: const Padding(
          //     padding: EdgeInsets.only(left: 20),
          //     child: Text("Large Tile", style: TextStyle(
          //       color: CupertinoColors.white
          //     ))
          //   ),
          //   previousPageTitle: "Back",
          // ),
          // CupertinoSliverNaviBar(textLocation: widget.textLocation),
          SliverToBoxAdapter(
              child: FractionallySizedBox(
                  widthFactor: 0.9,
                  child: ClipRect(
                      child: Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: CupertinoSearchTextField(
                            controller: _controller,
                            onChanged: (value) => _updateUserList(value),
                            onSubmitted: (value) => _updateUserList(value),
                            onSuffixTap: () => _updateUserList(''),
                          ))))),
          CupertinoSliverGrid(userList: userList),
        ],
      )
    );
  }
}
