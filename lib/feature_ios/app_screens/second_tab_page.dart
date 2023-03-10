import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ios_chatapp/model/users.dart';
import 'package:ios_chatapp/provider/user_provider.dart';
import 'package:ios_chatapp/widgets/cupertino_scroll_view/cupertino_sliver_grid.dart';

class SecondTabPage extends StatefulWidget {
  // final dynamic textLocation;
  // final List<User> userList;

  const SecondTabPage(
      {super.key,
      // required this.textLocation,
      // required this.userList,
      required});

  @override
  State<SecondTabPage> createState() => _SecondTabPageState();
}

class _SecondTabPageState extends State<SecondTabPage> {
  // late List<User> _filteredUsers = [];
  List<User> userList = List.empty(growable: true);
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();

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
      userList = userList
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    } else {
      _controller.text = '';
      userList = userList;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
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
    );
  }
}
