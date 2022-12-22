import 'package:flutter/cupertino.dart';
import 'package:ios_chatapp/model/users.dart';
import 'package:ios_chatapp/widgets/cupertino_scroll_view/cupertino_sliver_navi_bar.dart';

class CupertinoSettingsPage extends StatefulWidget {
  final dynamic textLocation;
  final List<User> userList;

  const CupertinoSettingsPage(
      {super.key, required this.textLocation, required this.userList});

  @override
  State<CupertinoSettingsPage> createState() => _CupertinoSettingsPageState();
}

class _CupertinoSettingsPageState extends State<CupertinoSettingsPage> {
  DateTime date = DateTime(2022, 4, 1);
  bool chaBackup = true;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CupertinoSliverNaviBar(textLocation: widget.textLocation),
      ],
    );
  }
}
