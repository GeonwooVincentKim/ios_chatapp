import 'package:flutter/cupertino.dart';

class CupertinoCall extends StatefulWidget {
  final String textLocation; 
  const CupertinoCall({super.key, required this.textLocation});

  @override
  State<CupertinoCall> createState() => _CupertinoCallState();
}

class _CupertinoCallState extends State<CupertinoCall> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text(widget.textLocation)),
      child: Center(
        child: Text(widget.textLocation),
      ),
    );
  }
}
