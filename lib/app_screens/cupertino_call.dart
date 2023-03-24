import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:ios_chatapp/model/users.dart';
import 'package:ios_chatapp/provider/user_provider.dart';
import 'package:ios_chatapp/shared/style.dart';
import 'package:ios_chatapp/widgets/custom/tile/user_detail.dart';
import 'package:mobile_number/mobile_number.dart';
import 'package:phone_selector/phone_selector.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CupertinoCall extends StatefulWidget {
  final String textLocation; 
  const CupertinoCall({super.key, required this.textLocation});

  @override
  State<CupertinoCall> createState() => _CupertinoCallState();
}

class _CupertinoCallState extends State<CupertinoCall> {
  List<User> getUserList = List.empty(growable: true);
  String getNumber = '';
  String _phoneNumber = '';

  String _mobileNumber = '';
  List<SimCard> _simCard = <SimCard>[];

  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> newUser = {
    'name': '',
    'color': '',
    'oppositeColor': '',
    'phoneNumber': '',
  };
  
  @override
  void initState() {
    final User getOneUser = Provider.of<UserProvider>(context, listen: false).getMyInfo;
    // getNumber = PhoneSelector.getPhoneNumber() as String;
    
    newUser['name'] = getOneUser.name;
    newUser['color'] = getOneUser.color;
    newUser['oppositeColor'] = getOneUser.oppositeColor;
    newUser['phoneNumber'] = getOneUser.phoneNumber;
    
    super.initState();
    initMobileNumberState();
  }

  _getPhoneNumber() async {
    String? phoneNumber;

    try {
      phoneNumber = await PhoneSelector.getPhoneNumber();
      print("Number -> $phoneNumber");
    } catch (e) {
      print(e);
      phoneNumber = 'Failed to get Phone Number';
    }

    if (mounted) {
      setState(() {
        _phoneNumber = phoneNumber!;
      });
    }
  }

  Future<void> initMobileNumberState() async {
    if (!await MobileNumber.hasPhonePermission) {
      await MobileNumber.requestPhonePermission;
      return;
    }
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      _mobileNumber = (await MobileNumber.mobileNumber)!;
      newUser['phoneNumber'] = _mobileNumber;
      print("Mobile -> $_mobileNumber");
      // _simCard = (await MobileNumber.getSimCards)!;
    } on PlatformException catch (e) {
      debugPrint("Failed to get mobile number because of '${e.message}'");
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.textLocation),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.add),
          onPressed: () {
            // _getPhoneNumber();
            Navigator.of(context).pushNamed("/call/add");
          },
          // onPressed: () => Navigator.pop(context),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.2),
            child: Consumer<UserProvider>(
              builder: ((context, mainUser, child) {
                final User user = mainUser.getMyInfo;
          
                return ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.5),
                  itemCount: 1,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                
                    return CupertinoListTile(
                      title: Text(user.name),
                      subtitle: Text(_mobileNumber),
                      leading: CircleAvatar(
                        backgroundColor: user.color,
                        radius: 30,
                        child: ClipOval(
                          child: Image.asset(
                            "assets/image/user/sample_user.png",
                            fit: BoxFit.cover
                          ),
                        )
                      ),
                      onTap: () {},
                      trailing: TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                          shape: const RoundedRectangleBorder(
                            side: BorderSide(color: blue)
                          )
                        ),
                        child: const Text('Call'),
                        onPressed: () async {
                          // ignore: deprecated_member_use
                          launch('tel://$_mobileNumber');
                          await FlutterPhoneDirectCaller.callNumber(_mobileNumber);
                        },
                      ),
                    );
                  },
                );
              })
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.35),
            child: Consumer<UserProvider>(
              builder: ((context, userElement, child) {
                final List<User> listUser = userElement.userList;
                getUserList = listUser.toList();
              
                return ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.08),
                  itemCount: getUserList.length,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = getUserList[index];
                
                    return CupertinoListTile(
                      title: Text(item.name),
                      subtitle: Text(item.phoneNumber),
                      leading: CircleAvatar(
                        backgroundColor: item.color,
                        radius: 30,
                        child: ClipOval(
                          child: Image.asset(
                            "assets/image/user/sample_user.png",
                            fit: BoxFit.cover
                          ),
                        )
                      ),
                      onTap: () {
                        print("Here?");
                        Provider.of<UserProvider>(context, listen: false).selectUser(item);
                        Navigator.pushNamed(context, "/call/detail/${item.userId}");
                        // UserDetail(user: item);
                      },
                      trailing: TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                          shape: const RoundedRectangleBorder(
                            side: BorderSide(color: blue)
                          )
                        ),
                        child: const Text('Call'),
                        onPressed: () async {
                          // ignore: deprecated_member_use
                          launch('tel://${item.phoneNumber}');
                          await FlutterPhoneDirectCaller.callNumber(item.phoneNumber);
                        },
                      ),
                    );
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
