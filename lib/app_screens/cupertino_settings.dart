import 'package:flutter/cupertino.dart';
import 'package:ios_chatapp/model/users.dart';
import 'package:ios_chatapp/widgets/cupertino_scroll_view/cupertino_sliver_navi_bar.dart';
import 'package:ios_chatapp/widgets/custom/custom_cupertino.dart';
import 'package:ios_chatapp/widgets/custom/form/button/custom_cupertino_button.dart';

class CupertinoSettingsPage extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables

  final String textLocation;
  const CupertinoSettingsPage({super.key, required this.textLocation});

  @override
  State<CupertinoSettingsPage> createState() => _CupertinoNavigationWidgetState();
}

class _CupertinoNavigationWidgetState extends State<CupertinoSettingsPage> {
  DateTime date = DateTime(2022, 4, 1);
  bool chatBackup = true;

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => SizedBox(
        height: 300,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.textLocation)
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 100),
            CupertinoFormSection(
              header: const Text('Account Details'),
              children: [
                CustomCupertinoFormRow(
                  prefix: "Account Details",
                  childWidget: CupertinoTextFormFieldRow(
                    placeholder: "UserName",
                  ),
                ),
                const CustomCupertinoFormRow(
                  prefix: "Email", 
                  childWidget: Text('example@gmail.com')
                ),
                CustomCupertinoFormRow(
                  prefix: "Chat Backup",
                  childWidget: CupertinoSwitch(
                    value: chatBackup,
                    onChanged: (value) => setState(() {
                      chatBackup = !chatBackup;
                    }),
                  )
                ),
              ],
            ),
            const CustomCupertinoButton(
              buttonText: "Chat Wallpaper", 
              isModal: true, 
              isFilled: true
            ),
            const CustomCupertinoButton(
              buttonText: "Delete all chat",
              isModal: false,
              isFilled: true
            ),
            Center(
              child: CupertinoButton(
                // Display a CupertinoDatePicker in date picker mode.
                onPressed: () => _showDialog(
                  CupertinoDatePicker(
                    backgroundColor: CupertinoColors.white,
                    initialDateTime: date,
                    mode: CupertinoDatePickerMode.date,
                    use24hFormat: true,
                    // This is called when the user changes the date.
                    onDateTimeChanged: (DateTime newDate) {
                      setState(() => date = newDate);
                    },
                  ),
                ),
                // In this example, the date value is formatted manually. You can use intl package
                // to format the value based on user's locale settings.
                child: Text(
                  '${date.month}-${date.day}-${date.year}',
                  style: const TextStyle(
                    fontSize: 22.0,
                  ),
                ),
              ),
            ),
            const CustomCupertinoButton(
                buttonText: "Save", isModal: true, isFilled: false)
          ]
        )
      )
    );
    // child: CupertinoSettingsPage(textLocation: titleText,
    // child: Center(child: Text(widget.titleText)));
  }
}
