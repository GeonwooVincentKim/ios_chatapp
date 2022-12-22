import 'package:flutter/cupertino.dart';

class BodyPageScaffold extends StatefulWidget {
  const BodyPageScaffold({super.key});

  @override
  State<BodyPageScaffold> createState() => _BodyPageScaffoldState();
}

class _BodyPageScaffoldState extends State<BodyPageScaffold> {
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Chat App'),
      ),
      child: Center(
        child: Text('Hi')
      )
    );
  }
}
