import 'package:flutter/cupertino.dart';

class SignUp extends StatefulWidget {
  final Function() onClickedSignIn;
  
  const SignUp({super.key, required this.onClickedSignIn});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}