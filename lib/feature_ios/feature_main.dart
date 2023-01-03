import 'package:flutter/cupertino.dart';
import 'package:ios_chatapp/feature_ios/feature_mainpage.dart';
import 'package:overlay_support/overlay_support.dart';

// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown
//   ]);

//   runApp(MyApp());
// }
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // static const String title = "Has Internet?";

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: CupertinoApp(
        debugShowCheckedModeBanner: false,
        // title: title,
        theme: CupertinoThemeData(brightness: Brightness.light),
        home: MainPage(),
      )
    );
  }
}
