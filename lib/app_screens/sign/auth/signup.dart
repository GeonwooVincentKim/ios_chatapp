import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:ios_chatapp/main.dart';
import 'package:ios_chatapp/shared/utils.dart';
import 'package:email_validator/email_validator.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUp extends StatefulWidget {
  final Function() onClickedSignIn;
  
  const SignUp({super.key, required this.onClickedSignIn});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final checkPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    checkPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.03,
                  left: MediaQuery.of(context).size.width * 0.05,
                ),
                // padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 10, 0),
                child: "Sign Up".text.xl5.bold.color(context.theme.primaryColor).make(),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05
                ),
                // padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 10, 0),
                child: "Create your account".text.xl2.make(),
              ),
              CupertinoFormSection.insetGrouped(
                header: "Personal Details".text.make(),
                backgroundColor: CupertinoColors.lightBackgroundGray,
                children: [
                  CupertinoFormRow(
                    prefix: "Email".text.make(),
                    child: CupertinoTextFormFieldRow(
                      controller: emailController,
                      cursorColor: CupertinoColors.white,
                      textInputAction: TextInputAction.next,
                      placeholder: "Email",
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (email) =>
                        email != null && !EmailValidator.validate(email) 
                          ? 'Enter a valid email'
                          : null,
                    ),
                    // error: "Enter a valid Email".text.make()
                  ),
                  CupertinoFormRow(
                    prefix: "Password".text.make(),
                    child: CupertinoTextFormFieldRow(
                      controller: passwordController,
                      cursorColor: CupertinoColors.white,
                      textInputAction: TextInputAction.done,
                      placeholder: "Password",
                      obscureText: true,
                      obscuringCharacter: '*',
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (password) { 
                        if (password == null || password.isEmpty) {
                          return 'Enter a valid password';
                        } else if (password.length < 6) {
                          return 'Must be at least 6 characters';
                        } else {
                          return null;
                        }
                      }
                    )
                  ),
                  CupertinoFormRow(
                    prefix: "Confirm Password".text.make(),
                    child: CupertinoTextFormFieldRow(
                      controller: checkPasswordController,
                      cursorColor: CupertinoColors.white,
                      textInputAction: TextInputAction.done,
                      placeholder: "Check your password",
                      obscureText: true,
                      obscuringCharacter: '*',
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (password) { 
                        if (password == null || password.isEmpty) {
                          return 'Enter a valid password';
                        } else if (password != passwordController.text) {
                          return 'Passwords do not match';
                        } else {
                          return null;
                        }
                      }
                    )
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Center(
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: signUp,
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
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 18,
                        color: CupertinoColors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Center(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: CupertinoColors.inactiveGray, fontSize: 18),
                    text: 'Already have an account?  ',
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = widget.onClickedSignIn,
                        text: 'Sign In',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: CupertinoTheme.of(context).primaryColor
                          // color: CupertinoTheme.of(context).colorScheme.secondary
                        )
                      )
                    ]
                  )
                ),
              )
            ],
          )
        ),
      ),
    );
    // return SafeArea(
    //   child: Form(
    //     key: formKey,
    //     autovalidateMode: AutovalidateMode.always,
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         "Sign Up".text.xl5.bold.color(context.theme.primaryColor).make(),
    //         CupertinoFormSection(
    //           header: "Personal Details".text.make(),
    //           backgroundColor: CupertinoColors.lightBackgroundGray,
    //           children: [
    //             CupertinoFormRow(
    //               prefix: "Email".text.make(),
    //               child: CupertinoTextFormFieldRow(
    //                 controller: emailController,
    //                 cursorColor: CupertinoColors.white,
    //                 textInputAction: TextInputAction.next,
    //                 placeholder: "Email",
    //                 autovalidateMode: AutovalidateMode.onUserInteraction,
    //                 validator: (email) =>
    //                   email != null && !EmailValidator.validate(email) 
    //                     ? 'Enter a valid email'
    //                     : null,
    //               ),
    //               // error: "Enter a valid Email".text.make()
    //             ),
    //             CupertinoFormRow(
    //               prefix: "Password".text.make(),
    //               child: CupertinoTextFormFieldRow(
    //                 controller: passwordController,
    //                 cursorColor: CupertinoColors.white,
    //                 textInputAction: TextInputAction.done,
    //                 placeholder: "Password",
    //                 obscureText: true,
    //                 autovalidateMode: AutovalidateMode.onUserInteraction,
    //                 validator: (password) { 
    //                   if (password == null || password.isEmpty) {
    //                     return 'Enter a valid password';
    //                   } else if (password.length < 6) {
    //                     return 'Must be at least 6 characters';
    //                   } else {
    //                     return null;
    //                   }
    //                 }
    //               )
    //             )
    //           ],
    //         ),
    //         "Create your account".text.xl2.make()
    //       ],
    //     ),
    //   )
    // );
  //   return SafeArea(
  //     child: Container(
  //       padding: EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height * 0.08),
  //       child: Form(
  //         key: formKey,
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             // SizedBox(height: 60),
  //             // FlutterLogo(size: 120),
  //             // SizedBox(height: 20),
  //             Text(
  //               "Hey There,\n Welcome back",
  //               textAlign: TextAlign.center,
  //               style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)
  //             ),
  //             SizedBox(height: 40),
  //             CupertinoTextFormFieldRow(
  //               controller: emailController,
  //               cursorColor: CupertinoColors.white,
  //               textInputAction: TextInputAction.next,
  //               placeholder: "Email",
  //               autovalidateMode: AutovalidateMode.onUserInteraction,
  //               validator: (email) =>
  //                 email != null && !EmailValidator.validate(email)
  //                   ? 'Enter a valid email'
  //                   : null,
  //             ),
  //             SizedBox(height: 4),
  //             // Difference between TextField and TextFormField
  //             // https://stackoverflow.com/questions/54661567/what-is-the-difference-between-textformfield-and-textfield
  //             CupertinoTextFormFieldRow(
  //               controller: passwordController,
  //               cursorColor: CupertinoColors.white,
  //               textInputAction: TextInputAction.done,
  //               placeholder: "Password",
  //               obscureText: true,
  //               autovalidateMode: AutovalidateMode.onUserInteraction,
  //               validator: (value) =>
  //                 value != null && value.length < 6
  //                   ? 'Enter min. 6 characters'
  //                   : null,
  //             ),
  //             SizedBox(height: MediaQuery.of(context).size.height * 0.05),
  //             CupertinoButton(
  //               padding: EdgeInsets.zero,
  //               onPressed: signUp,
  //               child: Container(
  //                 padding: EdgeInsets.symmetric(
  //                   horizontal: MediaQuery.of(context).size.width * 0.3,
  //                   vertical: MediaQuery.of(context).size.height * 0.02
  //                 ),
  //                 // padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  //                 decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(20),
  //                   color: CupertinoColors.activeBlue,
  //                 ),
  //                 child: Row(
  //                   mainAxisSize: MainAxisSize.min,
  //                   children: [
  //                     Icon(
  //                       CupertinoIcons.lock_open,
  //                       size: MediaQuery.of(context).size.height * 0.03,
  //                       color: CupertinoColors.white,
  //                     ),
  //                     SizedBox(width: MediaQuery.of(context).size.width * 0.01),
  //                     const Text(
  //                       'Add',
  //                       style: TextStyle(
  //                         fontSize: 18,
  //                         color: CupertinoColors.white,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //             SizedBox(height: MediaQuery.of(context).size.height * 0.03),
  //             RichText(
  //               text: TextSpan(
  //                 style: TextStyle(color: CupertinoColors.white, fontSize: 18),
  //                 text: 'Already have an account?  ',
  //                 children: [
  //                   TextSpan(
  //                     recognizer: TapGestureRecognizer()
  //                       ..onTap = widget.onClickedSignIn,
  //                     text: 'Sign Up',
  //                     style: TextStyle(
  //                       decoration: TextDecoration.underline,
  //                       color: CupertinoTheme.of(context).primaryColor
  //                       // color: Theme.of(context).colorScheme.secondary
  //                     )
  //                   )
  //                 ]
  //               )
  //             ),
  //             SizedBox(height: MediaQuery.of(context).size.height * 0.03),
  //             // SizedBox(height: 20),
  //             RichText(
  //               text: TextSpan(
  //                 style: TextStyle(color: CupertinoColors.white, fontSize: 18),
  //                 text: 'Already have an account?  ',
  //                 children: [
  //                   TextSpan(
  //                     recognizer: TapGestureRecognizer()
  //                       ..onTap = widget.onClickedSignIn,
  //                     text: 'Sign Up',
  //                     style: TextStyle(
  //                       decoration: TextDecoration.underline,
  //                       // color: Theme.of(context).colorScheme.secondary
  //                     )
  //                   )
  //                 ]
  //               )
  //             )
  //           ],
  //         ),
  //       ),
  //     )
  //   );
  }

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CupertinoActivityIndicator())
    );

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      
      Utils.showSnackBar(e.message);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
