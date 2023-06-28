import 'dart:async';

import 'package:animated_check/animated_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

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

    isAnimationDone = false;

    if (!isAnimationDone) {
      timer = Timer.periodic(
        Duration(seconds: 3), 
        (_) => checkAnimationDone()
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkAnimationDone() async {
    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isAnimationDone = true;
      // isAnimationDone = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isAnimationDone) timer?.cancel();
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
            // ElevatedButton.icon(
            //   style: ElevatedButton.styleFrom(
            //     minimumSize: Size.fromHeight(50)
            //   ),
            //   icon: const Icon(Icons.arrow_back, size: 32),
            //   label: Text(
            //     'Sign Out',
            //     style: TextStyle(fontSize: 24),
            //   ),
            //   onPressed: () => FirebaseAuth.instance.signOut(),
            // )
          ],
        )
      ),
    );
  }
}