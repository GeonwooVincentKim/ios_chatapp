import 'package:flutter/cupertino.dart';

class CupertinoNavigationWidget extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final Widget middleWidget;
  final String titleText;

  const CupertinoNavigationWidget({
    Key? key,
    required this.middleWidget,
    required this.titleText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: middleWidget,
      ),
      child: Center(child: Text(titleText))
    );
  }
}