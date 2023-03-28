import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:ios_chatapp/model/hive_users.dart';
import 'package:ios_chatapp/model/users.dart';
import 'package:ios_chatapp/provider/user_provider.dart';
import 'package:ios_chatapp/shared/style.dart';
import 'package:ios_chatapp/shared/utils.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomCupertinoListTile extends StatelessWidget {
  final bool checkIsList;
  // final User item;
  final HiveUsers item;
  final String mobileNumber;

  const CustomCupertinoListTile({
    super.key,
    required this.checkIsList,
    required this.item,
    required this.mobileNumber
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      title: Text(item.name),
      subtitle: checkIsList ? Text(item.phoneNumber) : Text(mobileNumber),
      leading: CircleAvatar(
        // backgroundColor: Utils().convertToColor(item.color),
        backgroundColor: blueAccent,
        // backgroundColor: Utils().convertToString(item.color) as Color,
        radius: 30,
        child: ClipOval(
          child: Image.asset(
            "assets/image/user/sample_user.png",
            fit: BoxFit.cover
          ),
        )
      ),
      onTap: checkIsList ? () {
        print("Here?");
        Provider.of<UserProvider>(context, listen: false).selectUserHive(item);
        Navigator.pushNamed(context, "/call/detail/${item.userId}");
        // UserDetail(user: item);
      } : () {},
      trailing: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: blue)
          )
        ),
        onPressed: checkIsList ? () async {
          // ignore: deprecated_member_use
          launch('tel://${item.phoneNumber}');
          await FlutterPhoneDirectCaller.callNumber(item.phoneNumber);
        } : () async {
          // ignore: deprecated_member_use
          launch('tel://$mobileNumber');
          await FlutterPhoneDirectCaller.callNumber(mobileNumber);
        },
        child: const Text('Call'),
      ),
    );
  }
}
