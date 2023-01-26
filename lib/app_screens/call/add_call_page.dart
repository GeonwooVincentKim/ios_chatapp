import 'package:flutter/cupertino.dart';
import 'package:ios_chatapp/model/users.dart';

class AddCallPage extends StatefulWidget {
  final String callInfo;
  const AddCallPage({super.key, required this.callInfo});

  @override
  State<AddCallPage> createState() => _AddCallPageState();
}

class _AddCallPageState extends State<AddCallPage> {
  late User callUser;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text(widget.callInfo)),
      child: Container(
        child: Column(
          children: [
            // Text(widget.callInfo.)
          ],
        ),
      ),
    );
  }
}