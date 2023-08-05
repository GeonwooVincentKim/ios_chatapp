import 'package:flutter/cupertino.dart';
import 'package:ios_chatapp/app_screens/sign/auth/signup.dart';
import 'package:ios_chatapp/app_screens/sign/signin.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin
    ? SignIn(onClickedSignUp: toggle)
    : SignUp(onClickedSignIn: toggle);

  void toggle() => setState(() => isLogin = !isLogin);
}
