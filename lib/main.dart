import 'package:flutter/cupertino.dart';
import 'package:ios_chatapp/app_screens/chat/other_user_profile.dart';
import 'package:ios_chatapp/app_screens/cupertino_chat.dart';
import 'package:ios_chatapp/app_screens/cupertino_settings.dart';
import 'package:ios_chatapp/app_screens/page_not_found.dart';
import 'package:ios_chatapp/body.dart';
import 'package:ios_chatapp/model/users.dart';
import 'package:ios_chatapp/provider/user_provider.dart';
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
      child: OverlaySupport.global(
        // ignore: prefer_const_constructors
        child: CupertinoApp(
          debugShowCheckedModeBanner: false,
          // ignore: prefer_const_constructors
          theme: CupertinoThemeData(brightness: Brightness.light),
          // home: Body(),
          initialRoute: "/",
          routes: {
            "/": (context) => Body(),
          },
          onGenerateRoute: (settings) {
            final List<String> pathElements = settings.name!.split("/");
            print("Name -> ${settings.name}");

            if (pathElements[0] != '') return null;
            if (pathElements[1] == 'user') {
              // final User? args = settings.arguments as User?;
              String userId = pathElements[2];
              return CupertinoPageRoute(builder: ((context) => OtherUserProfile(userId: userId)), settings: settings);
            }
            // if (!(pathElements.contains('profile'))) {
            //   final User? args = settings.arguments as User?;
            //   return CupertinoPageRoute(builder: (context) => OtherUserProfile(userId: args!.userId));
            // }
            // final List<String> pathElements = settings.name!.split("/");
            // if (pathElements[0] != '') return null;
            // if (pathElements.contains('profile')) {
            //   final User? args = settings.arguments as User?;

            //   String profileId = pathElements[2];
            //   print('Profile Id -> ${args!.userId}');
            //   return CupertinoPageRoute(builder: (context) => OtherUserProfile(userId: profileId));
            //   // return CupertinoPageRoute(builder: (context) => UserTile(user: args));
            // }

            return null;
          },
        )
      )
    );
  }
}
