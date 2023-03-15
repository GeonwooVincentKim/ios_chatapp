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
    // var buffer = StringBuffer();

    // text = text.replaceAll(r'/\s/gi', '');
    // text = text.replaceAll(r'/[^0-9]/g', '');

    // if (text.length == 11) {
    //   text = text.replaceAll(r'/(\d{2,3})(\d{4})(\d{4})/', '${1}-${2}-${3}');
    //   buffer.write(text);
    //   print(text);
    // } else if (text.length == 8) {
    //   text = text.replaceAll(r'/(\d{4})(\d{4})/', '${1}-${2}');
    //   buffer.write(text);
    // } else {
    //   if (text.indexOf('02') == 0) {
    //     if (text.length == 9) {
    //       text = text.replaceAll(r'/(\d{2})(\d{3})(\d{4})$/g', '${1}-${2}-${3}').replaceAll(r'/(\-{1,2})$/g', '');
    //       buffer.write(text);
    //     } else {
    //       text = text.replaceAll(r'/(\d{2})(\d{3})(\d{4})', '${1}-${2}-${3}');
    //       buffer.write(text);
    //     }
    //   } else {
    //     text = text.replaceAll(r'/(\d{2})(\d{3})(\d{4})', '${1}-${2}-${3}');
    //     buffer.write(text);
    //   }
    // }

    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      

      buffer.write(text[i]);
      
      var nonZeroIndex = i + 1;
      print("Non Index -> $nonZeroIndex");

      if (nonZeroIndex <= 3) {
        if (nonZeroIndex % 3 == 0 && nonZeroIndex != text.length) {
          buffer.write('-');
        }
      } else {
        if (text.length == 11) {
          if (nonZeroIndex % 7 == 0 && nonZeroIndex != text.length && nonZeroIndex > 4) {
            buffer.write("-");
          }
        } else {
          if (nonZeroIndex % 6 == 0 && nonZeroIndex != text.length && nonZeroIndex > 4) {
            buffer.write("-");
          }
        }
      }

      // if (nonZeroIndex <= 3) {
      //   if (nonZeroIndex % 3 == 0 && nonZeroIndex != text.length) {
      //     buffer.write('-');
      //   }
      // } else {
      //   if (nonZeroIndex != text.length && nonZeroIndex > 4) {
      //     if (text.length == 11 && nonZeroIndex & 7 == 0) {
      //       buffer.write("-");
      //     } else if (text.length == 10 && nonZeroIndex & 6 == 0) {
      //       buffer.write("-");
      //     }
      //   }
      // }
    }
    
    // if (text.length == 10) {
    //   for (int i = 0; i < text.length; i++) {
    //     buffer.write(text[i]);

    //     var nonZeroSpecialIndex = i + 1;


    //   }
    // }

    var string = buffer.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection(baseOffset: string.length, extentOffset: string.length)
    );
  }
}