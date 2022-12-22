import 'package:flutter/cupertino.dart';

class CustomCupertinoFormRow extends StatelessWidget {
  final String prefix;
  final Widget childWidget;

  const CustomCupertinoFormRow(
      {Key? key, required this.prefix, required this.childWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoFormRow(prefix: Text(prefix), child: childWidget);
  }
}
