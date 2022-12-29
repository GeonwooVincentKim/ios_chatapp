import 'package:flutter/cupertino.dart';

class PageNotFound extends StatelessWidget {
  final dynamic textLocation;

  const PageNotFound(
      {super.key, required this.textLocation});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text(textLocation)),
      child: Center(
        child: Text(textLocation),
      ),
    );
  }
}
