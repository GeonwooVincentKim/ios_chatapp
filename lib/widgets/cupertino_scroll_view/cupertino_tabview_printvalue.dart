import 'package:flutter/cupertino.dart';
import 'package:ios_chatapp/app_screens/cupertino_chat.dart';
import 'package:ios_chatapp/app_screens/cupertino_settings.dart';
import 'package:ios_chatapp/app_screens/page_not_found.dart';
import 'package:ios_chatapp/model/users.dart';

class PrintValue extends StatelessWidget {
  final dynamic textLocation;
  final int index;

  const PrintValue(
      {super.key,
      required this.textLocation,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabView(
      builder: (context) {
        if (index == 0) {
          return CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(middle: Text(textLocation)),
            child: Center(
              child: Text(textLocation),
            ),
          );
        } else if (index == 1) {
          return const CupertinoChat();
        } else if (index == 2) {
          return const CupertinoSettingsPage();
        } else {
          return PageNotFound(textLocation: textLocation);
        }
      },
    );
  }
}
