import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ios_chatapp/feature_screen_arguments/app_screens/extract_arguments.dart';
import 'package:ios_chatapp/feature_screen_arguments/app_screens/pass_arguments.dart';
import 'package:ios_chatapp/feature_screen_arguments/model/screen_arguments.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Home Screen'),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // A button that navigates to a named route that. The named route
            // extracts the arguments by itself.
            ElevatedButton(
              child: const Text("Navigate to screen that extracts arguments"),
              onPressed: () {
                // When the user taps the button, navigate to the specific route
                // and provide the arguments as part of the RouteSettings.
                print('Home -> ExtractArguments');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExtractArgumentsScreen(),
                    // Pass the arguments as part of the RouteSettings. The
                    // ExtractArgumentScreen reads the arguments from these
                    // settings.
                    settings: RouteSettings(
                      arguments: ScreenArguments(
                        'Extract Arguments Screen',
                        'This message is extracted in the build method.',
                      ),
                    ),
                  ),
                );
              },
            ),
            // A button that navigates to a named route. For this route, extract
            // the arguments in the onGenerateRoute function and pass them
            // to the screen.
            ElevatedButton(
              child: const Text("Navigate to a named that accepts arguments"),
              onPressed: () {
                // When the user taps the button, navigate to a named route
                // and provide the arguments as an optional parameter.
                Navigator.pushNamed(
                  context,
                  "/passArguments"
                  // PassArgumentsScreen.routeName,
                  // arguments: ScreenArguments(
                  //   'Accept Arguments Screen',
                  //   'This message is extracted in the onGenerateRoute function.',
                  // ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}