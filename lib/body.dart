import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:ios_chatapp/shared/style.dart';
import 'package:ios_chatapp/shared/utils.dart';
import 'package:ios_chatapp/widgets/cupertino_scroll_view/cupertino_tabview_printvalue.dart';
// import 'package:flutter_application_1_1/cupertino_button/widgets/cupertino_navigation_widget.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late StreamSubscription subscription; 

  @override
  void initState() {
    super.initState();
    subscription = Connectivity().onConnectivityChanged.listen(showConnectivitySnackBar);
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.phone), label: 'Calls'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.chat_bubble_2), label: 'Chats'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings), label: 'Settings'),
        ]
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0: return PrintValue(textLocation: getTitleText[0], index: index);
          case 1: return PrintValue(textLocation: getTitleText[1], index: index);
          case 2: return PrintValue(textLocation: getTitleText[2], index: index);
        }
        return PrintValue(textLocation: getTitleText[0], index: 0);
      }
    );
  }

  void showConnectivitySnackBar(ConnectivityResult result) {
    final hasInternet = result != ConnectivityResult.none;
    final message = hasInternet
      ? 'You have again ${result.toString()}'
      : 'You have no Internet';

    final color = hasInternet ? CupertinoColors.activeGreen : CupertinoColors.systemRed;
    Utils.showTopSnackBar(context, message, color);
  }
}
