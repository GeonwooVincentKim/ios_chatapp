import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

/// Flutter code sample for [CupertinoTextFormFieldRow].

void main() => runApp(const FormSectionApp());

class FormSectionApp extends StatelessWidget {
  const FormSectionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: FromSectionExample(),
    );
  }
}

class FromSectionExample extends StatelessWidget {
  const FromSectionExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('CupertinoFormSection Sample'),
      ),
      // Add safe area widget to place the CupertinoFormSection below the navigation bar.
      child: SafeArea(
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          onChanged: () {
            Form.maybeOf(primaryFocus!.context!)?.save();
          },
          // child: CupertinoFormSection.insetGrouped(
          //   header: const Text('SECTION 1'),
          //   children: List<Widget>.generate(5, (int index) {
          //     return CupertinoTextFormFieldRow(
          //       prefix: const Text('Enter text'),
          //       placeholder: 'Enter text',
          //       validator: (String? value) {
          //         if (value == null || value.isEmpty) {
          //           return 'Please enter a value';
          //         }
          //         return null;
          //       },
          //     );
          //   }),
          // ),
          child: Column(
            children: [
              CupertinoFormSection.insetGrouped(
                header: "Sign Up".text.xl5.bold.color(context.theme.primaryColor).make(),
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CupertinoTextFormFieldRow(
                    prefix: "Name".text.make(),
                    placeholder: "Enter name",
                  ),
                  CupertinoTextFormFieldRow(
                    placeholder: "Enter phone",
                    prefix: "Phone".text.make(),
                  ),
                  20.heightBox
                  // Material(
                  //   color: context.theme.buttonColor,
                  //   borderRadius: BorderRadius.circular(8),
                  //   child: InkWell(
                  //     child: AnimatedContainer(
                  //       duration: Duration(seconds: 1),
                  //       width: 150,
                  //       height: 50,
                  //       alignment: Alignment.center,
                  //       child: Text(
                  //         "SignUp",
                  //         style: TextStyle(
                  //           color: Colors.white,
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 18,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ).centered(),
                ],
              ),
              CupertinoFormSection.insetGrouped(
                header: "Sign Up".text.xl5.bold.color(context.theme.primaryColor).make(),
                children: [
                  CupertinoTextFormFieldRow(
                    placeholder: "Enter email",
                    prefix: "Email".text.make(),
                  ),
                  CupertinoTextFormFieldRow(
                    obscureText: true,
                    prefix: "Password".text.make(),
                  ),
                  CupertinoTextFormFieldRow(
                    obscureText: true,
                    prefix: "Confirm Password".text.make(),
                  ),
                  // If there are more then two widgets exist
                  // Such as UI and UI
                  CupertinoFormRow(
                    prefix: "Terms & Conditions".text.make(),
                    child: CupertinoSwitch(
                      value: true,
                      onChanged: (value) {},
                    ),
                    // prefix: "I Agree".text.make(),
                  ),
                  20.heightBox,
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
