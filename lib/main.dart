import 'package:flutter/cupertino.dart';
import 'package:ios_chatapp/app_screens/cupertino_call.dart';
import 'package:ios_chatapp/app_screens/cupertino_chat.dart';
import 'package:ios_chatapp/app_screens/cupertino_settings.dart';
import 'package:ios_chatapp/body.dart';
import 'package:ios_chatapp/shared/style.dart';
import 'package:overlay_support/overlay_support.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return OverlaySupport(
      // ignore: prefer_const_constructors
      child: CupertinoApp(
        debugShowCheckedModeBanner: false,
        // ignore: prefer_const_constructors
        theme: CupertinoThemeData(brightness: Brightness.light),
        // home: Body(),
        initialRoute: "/",
        routes: {
          '/': (context) => const Body(),
          '/chat': (context) => CupertinoChat(textLocation: getTitleText[1]),
          '/settings': (context) => CupertinoSettingsPage(textLocation: getTitleText[2])
        }
      )
    );
  }
}
