import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:ios_chatapp/shared/utils.dart';
import 'package:ios_chatapp/widgets/custom/form/form_icon/cupertino_icon.dart';

class CustomCupertinoFormSection extends StatelessWidget {
  final bool isNameInput;
  final TextEditingController controller;
  final Function(String?) onSaved;
  final String? Function(String?) validator;

  const CustomCupertinoFormSection({
    super.key,
    required this.isNameInput,
    required this.controller,
    required this.onSaved,
    required this.validator
  });


  @override
  Widget build(BuildContext context) {
    return CupertinoFormSection.insetGrouped(
      header: isNameInput ? 
        const Text("Enter your name : ") : 
        const Text("Enter your Phone Number : "),
      children: [
        CupertinoTextFormFieldRow(
          inputFormatters: isNameInput ? [] : [
            FilteringTextInputFormatter.digitsOnly,
            NumberFormatter(),
            LengthLimitingTextInputFormatter(13)
          ],
          prefix: CupertinoIcon(iconData: isNameInput ? CupertinoIcons.person : CupertinoIcons.phone),
          placeholder: isNameInput ? 'Name' : 'Phone',
          controller: controller,
          onSaved: onSaved,
          validator: validator,
        ),
      ],
    );
  }
}

class NumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    print("text -> $text");

    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      
      var nonZeroIndex = i + 1;
      print("Non Index -> $nonZeroIndex");

      if (nonZeroIndex <= 3) {
        // 010, 011, 012, 017, 019
        if (nonZeroIndex % 3 == 0 && nonZeroIndex != text.length) {
          buffer.write('-');
        }
      } else {
        if (text.length == 11) {
          // 010-0000-0000
          if (nonZeroIndex % 7 == 0 && nonZeroIndex != text.length && nonZeroIndex > 4) {
            buffer.write("-");
          }
        } else {
          // 011-000-0000
          if (nonZeroIndex % 6 == 0 && nonZeroIndex != text.length && nonZeroIndex > 4) {
            buffer.write("-");
          }
        }
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection(baseOffset: string.length, extentOffset: string.length)
    );
  }
}