import 'package:flutter/cupertino.dart';
import 'package:ios_chatapp/body.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
        theme: CupertinoThemeData(brightness: Brightness.light),
        // home: BodyPageScaffold(),
        home: Body(),
        initialRoute: "/",
        routes: {
          // '/': (context) => Body(),
        });
  }
}
