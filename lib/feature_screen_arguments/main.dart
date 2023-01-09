import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ios_chatapp/feature_screen_arguments/app_screens/extract_arguments.dart';
import 'package:ios_chatapp/feature_screen_arguments/app_screens/home.dart';
import 'package:ios_chatapp/feature_screen_arguments/app_screens/pass_arguments.dart';
import 'package:ios_chatapp/feature_screen_arguments/model/screen_arguments.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // late RouteSettings settings = new RouteSettings();
  // final ScreenArguments? args = settings.arguments as ScreenArguments?;

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      // Provide a function to handle named routes. Use this function to
      // identify the named route being pushed, and create the correct
      // Screen.
      initialRoute: "/",
      routes: {
        "/": (context) => HomeScreen(),
        "/extractArguments": (context) => ExtractArgumentsScreen(),
        "/passArguments": (context) => PassArgumentsScreen(title: 'passArguments', message: 'message')
      },
      onGenerateRoute: (settings) {
        // If you push the PassArguments route
        final List<String> pathElements = settings.name!.split("/");
        print(pathElements); // [, passArguments]
        print(pathElements.length); // 2
        print(pathElements[1]); // passArguments

        // if (pathElements[0] != '') return null;
        if (pathElements[0] != '') return null;

        // Check pathElements has routeName
        if ((pathElements.contains('passArguments'))) {
          // Cast the arguments to the correct type: ScreenArguments.
          final ScreenArguments? args = settings.arguments as ScreenArguments?;
          
          // Then, extract the required data from the arguments and
          // pass the data to the correct screen.
          return CupertinoPageRoute(builder: (context) => PassArgumentsScreen(title: args!.title, message: args.message));
        }
      },
      title: 'Navigation with Arguments',
      // home: HomeScreen(),
    );
  }
}
