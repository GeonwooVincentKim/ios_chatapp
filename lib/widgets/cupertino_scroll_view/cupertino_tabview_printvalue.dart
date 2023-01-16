import 'package:flutter/cupertino.dart';
import 'package:ios_chatapp/app_screens/cupertino_call.dart';
import 'package:ios_chatapp/app_screens/cupertino_chat.dart';
import 'package:ios_chatapp/app_screens/cupertino_settings.dart';
import 'package:ios_chatapp/app_screens/page_not_found.dart';

class PrintValue extends StatelessWidget {
  final dynamic textLocation;
  final int index;

  const PrintValue(
      {super.key,
      required this.textLocation,
      required this.index});

  @override
  Widget build(BuildContext context) {
    if (index == 0) {
      return CupertinoCall(textLocation: textLocation);
      // return CupertinoPageScaffold(
      //   navigationBar: CupertinoNavigationBar(middle: Text(textLocation)),
      //   child: Center(
      //     child: Text(textLocation),
      //   ),
      // );
    } else if (index == 1) {
      return CupertinoChat(textLocation: textLocation);
    } else if (index == 2) {
      return CupertinoSettingsPage(textLocation: textLocation);
    } else {
      return PageNotFound(textLocation: textLocation);
    }
  }
}
