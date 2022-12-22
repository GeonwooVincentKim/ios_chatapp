import 'package:flutter/cupertino.dart';
import 'package:ios_chatapp/widgets/custom/modal_popup/cupertino_dialog.dart';
import 'package:ios_chatapp/widgets/custom/modal_popup/cupertino_modal_popup.dart';

class CustomCupertinoButton extends StatelessWidget {
  final String buttonText;
  final bool isModal;
  final bool isFilled;

  const CustomCupertinoButton(
      {super.key,
      required this.buttonText,
      required this.isModal,
      required this.isFilled});

  @override
  Widget build(BuildContext context) {
    return isFilled == true
        ? Center(
            child: CupertinoButton(
                onPressed: () {
                  isModal == true
                      ? showCupertinoModalPopup(
                          context: context,
                          builder: (BuildContext context) =>
                              const CupertinoModalPopup())
                      : showCupertinoDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              const CupertinoDialog());
                },
                child: Text(buttonText)))
        : Center(
            child: CupertinoButton(onPressed: () {}, child: Text(buttonText)));
  }
}
