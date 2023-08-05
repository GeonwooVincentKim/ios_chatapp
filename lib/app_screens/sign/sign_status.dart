import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ios_chatapp/app_screens/cupertino_call.dart';
import 'package:ios_chatapp/app_screens/sign/auth/auth.dart';
import 'package:ios_chatapp/app_screens/sign/sign_home.dart';
import 'package:ios_chatapp/app_screens/sign/signin.dart';
import 'package:ios_chatapp/body.dart';

class SignStatus extends StatelessWidget {
  const SignStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.lightBackgroundGray,
      child: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) { 
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Something went wrong!!"));
          } else if (snapshot.hasData) {
            // return Body();
            // return CupertinoCall(textLocation: '');
            return SignHome();
          } else {
            return AuthPage();
            // return SignIn();
          }
        },
      ),
    );
  }
}
