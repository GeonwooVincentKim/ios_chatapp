import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ios_chatapp/shared/style.dart';
import 'package:ios_chatapp/shared/utils.dart';

class SignIn extends StatefulWidget {
  final VoidCallback onClickedSignUp;

  const SignIn({super.key, required this.onClickedSignUp});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        // padding: EdgeInsets.all(16),
        alignment: Alignment.center,
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            // CupertinoTextField(
            //   controller: emailController,
            //   cursorColor: CupertinoColors.white,
            //   textInputAction: TextInputAction.next,
            //   decoration: InputDecoration(labelText: 'Email'),
            // ),
            CupertinoTextField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              controller: emailController,
              // padding: EdgeInsets.all(16),
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
              placeholder: 'Email',
              placeholderStyle: const TextStyle(color: black26),
              style: const TextStyle(color: black87),
              decoration: BoxDecoration(
                color: CupertinoColors.extraLightBackgroundGray,
                border: Border.all(
                  color: CupertinoColors.lightBackgroundGray,
                  width: 2
                ),
                borderRadius: BorderRadius.circular(10)
              ),
              cursorColor: CupertinoColors.activeGreen,
            ),
            // CupertinoTextField(
            //   controller: emailController,
            //   cursorColor: CupertinoColors.white,
            //   textInputAction: TextInputAction.next,
            //   placeholder: "Email",
            //   obscureText: true,
            // ),
            const SizedBox(height: 10),
            CupertinoTextField(
              textInputAction: TextInputAction.done,
              controller: passwordController,
              // padding: EdgeInsets.all(16),
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
              placeholder: 'Password',
              placeholderStyle: const TextStyle(color: black26),
              style: const TextStyle(color: black87),
              decoration: BoxDecoration(
                color: CupertinoColors.extraLightBackgroundGray,
                border: Border.all(
                  color: CupertinoColors.lightBackgroundGray,
                  width: 2
                ),
                borderRadius: BorderRadius.circular(10)
              ),
              // cursorColor: CupertinoColors.activeGreen,
              obscureText: true,
              obscuringCharacter: '*',
            ),
            // CupertinoTextField(
            //   controller: passwordController,
            //   textInputAction: TextInputAction.done,
            //   placeholder: "Password",
            //   obscureText: true,
            // ),
            // CupertinoTextField(
            //   controller: passwordController,
            //   textInputAction: TextInputAction.done,
            //   decoration: InputDecoration(labelText: 'Password'),
            //   obscureText: true,
            // ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: signIn,
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
                      CupertinoIcons.lock_open,
                      size: MediaQuery.of(context).size.height * 0.03,
                      color: CupertinoColors.white,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                    const Text(
                      'Add',
                      style: TextStyle(
                        fontSize: 18,
                        color: CupertinoColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            RichText(
              text: TextSpan(
                style: TextStyle(color: CupertinoColors.inactiveGray, fontSize: 18),
                text: 'No Account?  ',
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = widget.onClickedSignUp,
                    text: 'Sign Up',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      // color: CupertinoTheme.of(context).primaryColor
                      color: Theme.of(context).colorScheme.secondary
                    )
                  )
                ]
              )
            )
          ],
        ),
      ),
    );
  }

  Future signIn() async {
    showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CupertinoActivityIndicator())
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim()
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      
      Utils.showSnackBar(e.message);
    }

    
  }
}
