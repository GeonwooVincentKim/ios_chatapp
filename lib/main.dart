import 'package:flutter/cupertino.dart';
import 'package:ios_chatapp/body.dart';
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
        home: Body(),
        // initialRoute: "/",
        // routes: {
        //   // '/': (context) => Body(),
        // }
      )
    );
  }
}
