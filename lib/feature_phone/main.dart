import 'package:flutter/cupertino.dart';
import 'package:ios_chatapp/feature_phone/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Get Phone Number',
      home: Home(),
    );
  }
}
