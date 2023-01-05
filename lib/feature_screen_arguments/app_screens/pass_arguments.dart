import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// A Widget that accepts the necessary arguments via the constructor.
class PassArgumentsScreen extends StatelessWidget {
  static const routeName = '/passArguments';

  final String title;
  final String message;

  // This Widget accepts the arguments as constructor parameters. It does not
  // extract the arguments from the ModalRoute.
  //
  // The arguments are extracted by the onGenerateRoute function provided to the
  // MaterialApp widget.
  const PassArgumentsScreen({super.key, required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    print("Current RouteName (PassArguments)) -> ${routeName}");
    return CupertinoPageScaffold(
      // appBar: AppBar(
      //   title: Text(title),
      // ),
      // body: Center(
      //   child: Text(message),
      // ),
      navigationBar: CupertinoNavigationBar(
        middle: Text(title)
      ),
      child: Center(
        child: Text(message)
      )
    );
  }
}
