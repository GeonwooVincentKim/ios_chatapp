import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';

class RequestPermission extends StatelessWidget {
  const RequestPermission({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CupertinoButton(
          child: const Text("Request Permission"),
          onPressed: () async {
            if (await checkIfPermissionGranted()) {
              // SnackBar snackBar = S
            }
          },
        )
      )
    );
  }

  Future<bool> checkIfPermissionGranted() async {
    // Map<Permission, PermissionStatus> status = await [Permission.microphone].request();
    final status = await Permission.microphone.request();
    bool permitted = true;

    print("Check Status Granted -> ${!status.isGranted}");
    if (!status.isGranted) {
      permitted = false;
    }

    return permitted;
  }
}