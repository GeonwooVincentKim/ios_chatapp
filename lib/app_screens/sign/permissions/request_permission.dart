import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(RequestPermission());

class RequestPermission extends StatelessWidget {
  // final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // key: _key,
      theme: ThemeData(brightness: Brightness.light),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Here!!!"),
        ),
        body: Container(
          child: Builder(
            builder: (context) {
              return Center(
                // child: CupertinoButton(
                //   child: const Text("Request Permission"),
                //   onPressed: () async {
                //     if (await checkIfPermissionGranted()) {
                //       SnackBar snackBar = SnackBar(content: Text("Allowed clear!!!"));
                //       _key.currentContext.showSnackBar(snackBar);
                //     }
                //   },
                // )
                child: Column(
                  children: [
                    Text("Hrere!!!"),
                    ElevatedButton(
                      child: const Text("Request Permission"),
                      onPressed: () async {
                        if (await checkIfPermissionGranted()) {
                          
                          print("Clear");
                          SnackBar snackBar = SnackBar(
                            content: Text("Allowed clear!!!"),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {
                          print("Oh no");
                          SnackBar snackBar = SnackBar(
                            content: Text("Hmm!!!"),
                            action: SnackBarAction(
                              label: "Go To Settings",
                              onPressed: () {
                                openAppSettings();
                              },
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          // _key.currentState.show
                          // _key.currentState.showSnackBar(snackBar);

                        }
                      },
                    ),
                  ],
                ),
              );
            }
          )
        ),
      ),
    );
  }

  Future<bool> checkIfPermissionGranted() async {
    // Map<Permission, PermissionStatus> status = await [Permission.microphone].request();
    final status = await Permission.phone.request();
    bool permitted = true;

    print("Check Status Granted -> ${!status.isGranted}");
    if (!status.isGranted) {
      permitted = false;
    }

    return permitted;
  }
}