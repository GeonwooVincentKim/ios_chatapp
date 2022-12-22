import 'package:flutter/cupertino.dart';

class CupertinoModalPopup extends StatelessWidget {
  const CupertinoModalPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: const Text('Set Wallpaper Theme'),
      actions: <CupertinoActionSheetAction>[
        CupertinoActionSheetAction(
          child: const Text('Dark'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        CupertinoActionSheetAction(
          child: const Text('Light'),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
