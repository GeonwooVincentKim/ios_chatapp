import 'package:flutter/cupertino.dart';

class CupertinoDialog extends StatelessWidget {
  const CupertinoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Delete chat'),
      content: const Text('Proceed with deleting chat?'),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          child: const Text('No'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        CupertinoDialogAction(
          child: const Text('Yes'),
          isDestructiveAction: true,
          onPressed: () {
            // Do something destructive.
          },
        )
      ],
    );
  }
}
