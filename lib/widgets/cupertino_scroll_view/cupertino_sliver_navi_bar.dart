import 'package:flutter/cupertino.dart';

class CupertinoSliverNaviBar extends StatelessWidget {
  final String textLocation;

  const CupertinoSliverNaviBar({
    super.key,
    required this.textLocation,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoSliverNavigationBar(
      largeTitle: Text(textLocation),
      leading: const Text(
        'Edit',
        style: TextStyle(color: CupertinoColors.link),
      ),
      middle: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          CupertinoActivityIndicator(),
          SizedBox(width: 8),
          Text('Waiting for Network')
        ],
      )
    );
  }
}