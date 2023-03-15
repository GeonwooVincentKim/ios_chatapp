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

  static String validateMobile(String value) {
    print(value);

    String pattern = r'/^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/';
    String pattern2 = r'/^\d{2,3}-\d{3,4}-\d{4}$/';
    // pattern = value.replaceAllMapped(RegExp(r'(\d{3})(\d{3,4})(\d{4})'),(m) => '${m[1]}-${m[2]}-${m[3]}');

    RegExp regExp = RegExp(pattern);

    if (value.isEmpty) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }

    return '';
  }

  // bool isValidPhoneNumber() {
  //   return RegExp(r'^010-?([0-9]{4})-?([0-9]{4})$').hasMatch(this);
  // }
  // Color getRandomColor = Color(Random().nextInt(0xffffffff)).withOpacity(1.0);
  // const regexAdvertisement = /^(\d{4})-(\d{4})$/;
  // const regexMobilePhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
  // const regexPhone = /^\d{2,3}-\d{3,4}-\d{4}$/;

  // const registerNumberRegex = /^(\d{0,3})-(\d{0,2})-(\d{0,5})$/g;
}
