import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(RequestPermission());

class RequestPermission extends StatelessWidget {
  // final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      // key: _key,
      theme: CupertinoThemeData(brightness: Brightness.light),
      routes: {
        "/": (context) => const PermissionExist(),
        "/next": (context) => const NextPage()
      },
    );
  }
}

class PermissionExist extends StatefulWidget {
  const PermissionExist({super.key});

  @override
  State<PermissionExist> createState() => _PermissionExistState();
}

class _PermissionExistState extends State<PermissionExist> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // appBar: AppBar(
      //   title: Text("Here!!!"),
      // ),
      child: Container(
        child: Center(
          child: CupertinoButton(
            child: const Text("Request Permission"),
            onPressed: () async {
              if (await checkIfPermissionGranted()) {
                // SnackBar snackBar = SnackBar(content: Text("Allowed clear!!!"));
                // _key.currentContext.showSnackBar(snackBar);
                print("True");
                setState(() {
                  Navigator.pushNamedAndRemoveUntil(context, "/next", (route) => false);
                });
              } else {
                print("False~!!!");
              }
            },
          )
        )
      ),
    );
  }
  
  Future<bool> checkIfPermissionGranted() async {
    final status = await Permission.phone.request();
    bool permitted = true;

    print("Check Status Granted -> ${!status.isGranted}");
    if (!status.isGranted) {
      permitted = false;
    }

    return permitted;
  }
}

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(
        child: Center(
          child: Text("Success!!!")
        ),
      ),
    );
  }
}
