import 'package:flutter/cupertino.dart';
import 'package:ios_chatapp/app_screens/chat/other_user_profile.dart';
import 'package:ios_chatapp/app_screens/cupertino_chat.dart';
import 'package:ios_chatapp/app_screens/cupertino_settings.dart';
import 'package:ios_chatapp/app_screens/page_not_found.dart';
import 'package:ios_chatapp/body.dart';
import 'package:ios_chatapp/model/users.dart';
import 'package:ios_chatapp/provider/user_provider.dart';
import 'package:ios_chatapp/shared/arguments/other_user_profile_arguments.dart';
import 'package:ios_chatapp/shared/style.dart';
import 'package:ios_chatapp/widgets/custom/tile/user_tile.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => UserProvider())
      ],
      child: OverlaySupport(
        // ignore: prefer_const_constructors
        child: CupertinoApp(
          debugShowCheckedModeBanner: false,
          // ignore: prefer_const_constructors
          theme: CupertinoThemeData(brightness: Brightness.light),
          // home: Body(),
          initialRoute: "/",
          routes: {
            "/": (context) => const Body(),
            "/chat": (context) => CupertinoChat(textLocation: getTitleText[1]),
            "/settings": (context) => CupertinoSettingsPage(textLocation: getTitleText[2]),
            // '/profile': (context) => OtherUserProfile(userId: '1')
            OtherUserProfile.routeName: (context) => OtherUserProfile(userId: '1')
          },
          onGenerateRoute: (settings) {
            print(settings.name);
            
            final List<String> pathElements = settings.name!.split("/");
            print(pathElements);
            // print(pathElements.length);
            // print(pathElements[1]);

            if (pathElements[0] != '') return null;
            if ((pathElements.contains('profile'))) {
              final OtherUserProfileArguments? args = settings.arguments as OtherUserProfileArguments?;
              print(args!.userId);
              String userId = pathElements[2];

              return CupertinoPageRoute(builder: (context) => OtherUserProfile(userId: args.userId));
              // return CupertinoPageRoute(builder: ((context) => OtherUserProfile(userId: args!.userId)));
            }

            return null;
          },
          onUnknownRoute: (settings) {
            return CupertinoPageRoute(builder: (context) => PageNotFound(textLocation: getTitleText[3],));
          },
        )
      )
    );
  }
}
