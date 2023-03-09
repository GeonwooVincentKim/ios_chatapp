import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoFormSection.insetGrouped(
      header: Text('Enter your name:'),
      children: [
        CupertinoTextFormFieldRow(
          prefix: Icon(
            CupertinoIcons.person,
            color: CupertinoColors.systemGrey,
          ),
          placeholder: 'Name',
          controller: _textEditingController,
        ),
      ],
    );
  }
}
