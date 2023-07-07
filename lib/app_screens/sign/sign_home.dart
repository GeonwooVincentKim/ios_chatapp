import 'dart:async';

import 'package:animated_check/animated_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ios_chatapp/app_screens/cupertino_chat.dart';
import 'package:permission_handler/permission_handler.dart';

class SignHome extends StatefulWidget {
  @override
  State<SignHome> createState() => _SignHomeState();
}

class _SignHomeState extends State<SignHome> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool isAnimationDone = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOutCirc)
    );

    if (!isAnimationDone) {
      timer = Timer.periodic(
        Duration(seconds: 3), 
        (_) => checkAnimationDone()
      );
    }

    // setState(() {
    //   Navigator.of(context).pushNamed("/call");
    // });
    // Get.to(() => const CupertinoChat(textLocation: ''), transition: Transition.zoom);
  }

  @override
  void dispose() {
    timer?.cancel();
    _animationController.dispose();
    super.dispose();
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

  Future checkAnimationDone() async {
    // await FirebaseAuth.instance.currentUser!.reload();
    
    print("Check Status -> $isAnimationDone");

    setState(() {
      print("Check Status (setState) -> $isAnimationDone");
      isAnimationDone = true;
      // isAnimationDone = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    print("Check Status (setState Out) -> $isAnimationDone");

    if (isAnimationDone) {
      timer?.cancel();

      // checkIfPermissionGranted();

      setState(() {
        Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
        // Navigator.of(context).pushNamed("/main");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    _animationController.forward();

    return CupertinoPageScaffold(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedCheck(
              progress: _animation,
              size: 120
            ),
            const Text(
              'Signed In as',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              user.email!,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)
            ),
            const SizedBox(height: 40),
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () => FirebaseAuth.instance.signOut(),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.3,
                  vertical: MediaQuery.of(context).size.height * 0.02
                ),
                // padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: CupertinoColors.activeBlue,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      CupertinoIcons.back,
                      size: MediaQuery.of(context).size.height * 0.03,
                      color: CupertinoColors.white,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                    const Text(
                      'Sign out',
                      style: TextStyle(
                        fontSize: 20,
                        color: CupertinoColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
