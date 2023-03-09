import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import 'package:overlay_support/overlay_support.dart';

class Utils {
  static void showTopSliverBar(
    BuildContext context,
    // String titleText,
    String leadingText,
    String detailText
  ) => CupertinoSliverNavigationBar(
    // largeTitle: Text(titleText),
    leading: Text(
      leadingText,
      style: const TextStyle(color: CupertinoColors.link),
    ),
    middle: Row(
      mainAxisSize: MainAxisSize.min,
      children:  [
        const CupertinoActivityIndicator(),
        const SizedBox(width: 8),
        Text(detailText)
      ],
    )
  );

  static void showTopSnackBar(
    BuildContext context,
    String message,
    Color color,
  ) => showSimpleNotification(
    const Text('Internet Connectivity Update'),
    subtitle: Text(message),
    background: color
  );

  static String _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  static Random _rnd = Random();
  static String getRandomString(int length) => String.fromCharCodes(Iterable.generate(length, (_)
    => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}
