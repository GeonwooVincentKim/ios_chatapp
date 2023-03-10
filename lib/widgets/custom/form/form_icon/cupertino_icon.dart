import 'package:flutter/cupertino.dart';

class CupertinoIcon extends StatelessWidget {
  final IconData iconData;

  const CupertinoIcon({
    super.key,
    required this.iconData
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      color: CupertinoColors.systemGrey,
    );
  }
}
