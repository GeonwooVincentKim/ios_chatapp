import 'package:flutter/material.dart';
import 'package:ios_chatapp/feature_screen_arguments/model/screen_arguments.dart';

// A Widget that extracts the necessary arguments from the ModalRoute.
class ExtractArgumentsScreen extends StatelessWidget {
  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute settings and cast
    // them as ScreenArguments.
    final ScreenArguments? args = ModalRoute.of(context)?.settings.arguments as ScreenArguments?;

    return Scaffold(
      appBar: AppBar(
        title: Text(args!.title),
      ),
      body: Center(
        child: Text(args.message),
      ),
    );
  }
}