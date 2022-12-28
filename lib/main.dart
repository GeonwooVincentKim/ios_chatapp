import 'package:flutter/cupertino.dart';
import 'package:ios_chatapp/body.dart';
import 'package:overlay_support/overlay_support.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const OverlaySupport(
      child: CupertinoApp(
        debugShowCheckedModeBanner: false,
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
