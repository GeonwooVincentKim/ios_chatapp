import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ios_chatapp/app_screens/call/add_call_page.dart';
import 'package:ios_chatapp/app_screens/call/edit_call_page.dart';
import 'package:ios_chatapp/app_screens/chat/chat_page.dart';
import 'package:ios_chatapp/app_screens/chat/other_user_profile.dart';
import 'package:ios_chatapp/app_screens/cupertino_call.dart';
import 'package:ios_chatapp/app_screens/page_not_found.dart';
import 'package:ios_chatapp/body.dart';
import 'package:ios_chatapp/model/hive_users.dart';
import 'package:ios_chatapp/provider/user_provider.dart';
import 'package:ios_chatapp/shared/style.dart';
import 'package:ios_chatapp/widgets/custom/tile/user_detail.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart' as path;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // final dir = await path.getApplicationDocumentsDirectory();
  // Hive.init(dir.path);
  // Hive.initFlutter('user_db');
  Directory appDocumentDirectory = await path.getApplicationDocumentsDirectory();
  // Hive.init(appDocumentDirectory.path);
  // Hive.registerAdapter(HiveUsersAdapter());

  await Hive.initFlutter(appDocumentDirectory.path);
  // Hive.registerAdapter(HiveUsersAdapter());

  if (!Hive.isAdapterRegistered(1)) {
    print("Is not registered");
    Hive.registerAdapter<HiveUsers>(HiveUsersAdapter());
  }

  // Box<HiveUsers> listStorage = await Hive.openBox<HiveUsers>("user_db");
  // await Hive.openBox<HiveUsers>("user_db");
  await Hive.openBox<HiveUsers>("user_db");
  // await UserProvider().openBox();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => UserProvider())
      ],
      child: OverlaySupport.global(
        child: CupertinoApp(
          debugShowCheckedModeBanner: false,
          theme: const CupertinoThemeData(brightness: Brightness.light),
          initialRoute: "/",
          routes: {
            "/": (context) => const Body(),
            "/call": (context) => const CupertinoCall(textLocation: ''),
            "/profile": (context) => const OtherUserProfile(userId: ''),
            "/chat": (context) => const ChatPage(userInfo: ''),
            // "/call/callInfo": (context) => const AddCallPage(callInfo: '')
          },
          onGenerateRoute: (settings) {
            final List<String> pathElements = settings.name!.split("/");

            if (pathElements[0] != '') return null;
            if (pathElements[1] == 'profile') {
              String userId = pathElements[2];
              return CupertinoPageRoute(builder: ((context) => OtherUserProfile(userId: userId)), settings: settings);
            }

            if (pathElements[1] == 'chat') {
              String userId = pathElements[2];
              return CupertinoPageRoute(builder: ((context) => ChatPage(userInfo: userId)));
            }

            if (pathElements[1] == 'call') {
              String pathId = pathElements[2];
              
              if (pathId == 'add') {
                print("Here!!");
                return CupertinoPageRoute(builder: ((context) => const AddCallPage(callInfo: "Add")));
              }

              if (pathId == 'detail') {
                print("Detail!!!");
                return CupertinoPageRoute(builder: ((context) => const UserDetail(pageId: "Detail")));
              }

              if (pathId == "update") {
                print("Update!!!");
                return CupertinoPageRoute(builder: ((context) => const EditCallPage(callInfo: "Update")));
              }
            }
            return null;
          },
          onUnknownRoute: (settings) => CupertinoPageRoute(builder: (context) => PageNotFound(textLocation: getTitleText[3],))
        )
      )
    );
  }
}
