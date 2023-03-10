import 'package:flutter/cupertino.dart';
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
