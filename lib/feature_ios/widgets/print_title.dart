import 'package:flutter/cupertino.dart';
import 'package:ios_chatapp/feature_android/app_screens/first_tab_page.dart';
import 'package:ios_chatapp/feature_android/app_screens/second_tab_page.dart';

class PrintTitle extends StatelessWidget {
  final dynamic textLocation;
  final int index;
  const PrintTitle({super.key, required this.textLocation, required this.index});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabView(
      builder: (context) {
        if (index == 0) {
          return const FirstTabPage();
        } else if (index == 1) {
          return const SecondTabPage();
        } else {
          return CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(middle: Text(textLocation)),
            child: Center(
              child: Text(textLocation)
            )
          );
        }
      },
    );
  }
}
