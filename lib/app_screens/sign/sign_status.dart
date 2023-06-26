import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:ios_chatapp/app_screens/sign/signin.dart';
import 'package:ios_chatapp/body.dart';

class SignStatus extends StatelessWidget {
  const SignStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.activeGreen,
      child: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Body();
          } else {
            return SignIn();
          }
        },
      ),
    );
  }
}
