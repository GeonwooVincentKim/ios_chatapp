import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:hive/hive.dart';
import 'package:ios_chatapp/app_screens/sign/signin.dart';
import 'package:ios_chatapp/model/hive_users.dart';
import 'package:ios_chatapp/provider/user_provider.dart';
import 'package:ios_chatapp/shared/style.dart';
import 'package:ios_chatapp/shared/utils.dart';
import 'package:ios_chatapp/widgets/custom/tile/call_list_tile.dart';
import 'package:ios_chatapp/widgets/custom/tile/user_detail.dart';
import 'package:mobile_number/mobile_number.dart';
import 'package:phone_selector/phone_selector.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';

class CupertinoCall extends StatefulWidget {
  final String textLocation; 
  const CupertinoCall({super.key, required this.textLocation});

  @override
  State<CupertinoCall> createState() => _CupertinoCallState();
}

class _CupertinoCallState extends State<CupertinoCall> {
  // List<User> getUserList = List.empty(growable: true);
  // Set the type of 
  final user = FirebaseAuth.instance.currentUser!;
  List getUserList = List.empty(growable: true);
  // Box<dynamic>? getUserList;

  String getNumber = '';
  String _phoneNumber = '';

  String _mobileNumber = '';
  bool checkIsList = false;
  List<SimCard> _simCard = <SimCard>[];

  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> newUser = {
    'name': '',
    // 'color': '',
    // 'oppositeColor': '',
    'phoneNumber': '',
  };
  
  @override
  void initState() {
    // final User getOneUser = Provider.of<UserProvider>(context, listen: false).getMyInfo;
    final HiveUsers getOneUser = Provider.of<UserProvider>(context, listen: false).getMyInfoHive;
    
    // getNumber = PhoneSelector.getPhoneNumber() as String;
    
    newUser['name'] = getOneUser.name;
    // newUser['color'] = getOneUser.color;
    // newUser['oppositeColor'] = getOneUser.oppositeColor;
    newUser['phoneNumber'] = getOneUser.phoneNumber;
    
    super.initState();
    checkPermissionStatus();
  }

  @override
  void dispose() {
    // Hive.box('user_db').close();
    super.dispose();
  }
  
  Future<void> checkPermissionStatus() async {
    if (await checkIfPhonePermissionGranted()) {
      _mobileNumber = (await MobileNumber.mobileNumber)!;
      newUser['phoneNumber'] = _mobileNumber;
      print("Mobile -> $_mobileNumber");

      print("True~!!!");

      // Do not delete this part
      // Update the entire page
      setState(() {
        
      });
    } else {
      print("False~!!!");
    }
  }

  Future<bool> checkIfPhonePermissionGranted() async {
    final status = await Permission.phone.request();
    bool permitted = true;

    print("Check Status Granted -> ${!status.isGranted}");
    if (!status.isGranted) {
      permitted = false;
    }

    return permitted;
  }

  // Should have to know how to use SimCard Package
  // So I can get the Current User phone number automatically
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
                final HiveUsers user = mainUser.getMyInfoHive;

                return ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.5),
                  itemCount: 1,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CustomCupertinoListTile(checkIsList: false, item: user, mobileNumber: _mobileNumber);
                  },
                );
              })
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.35),
            child: Consumer<UserProvider>(
              builder: ((context, userElement, child) {
                // final List<HiveUsers> listUser = userElement.userBox as List<HiveUsers>;

                final Box<dynamic> listBox = userElement.userBox;
                getUserList = listBox.values.toList();
                // getUserList = listUser.toList();
                // getUserList = listUser;

                // userElement.userBox.values.length;

                return ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.08),
                  // padding: Utils.customEdgeInsets(context, 0.08),
                  itemCount: listBox.length,
                  // itemCount: userElement.userBox.values.length,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = getUserList[index];
                    return CustomCupertinoListTile(checkIsList: true, item: item, mobileNumber: '');
                  },
                );
              }),
            ),
          ),
        ],
      )
      // child: StreamBuilder<User?>(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Center(child: CircularProgressIndicator());
      //     } else if (snapshot.hasError) {
      //       return Center(child: Text("Something went wrong!!"));
      //     } else if (snapshot.hasData) {
      //       return Stack(
      //         alignment: Alignment.center,
      //         children: [
      //           Padding(
      //             padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.2),
      //             child: Consumer<UserProvider>(
      //               builder: ((context, mainUser, child) {
      //                 final HiveUsers user = mainUser.getMyInfoHive;

      //                 return ListView.builder(
      //                   shrinkWrap: true,
      //                   padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.5),
      //                   itemCount: 1,
      //                   physics: const ClampingScrollPhysics(),
      //                   itemBuilder: (context, index) {
      //                     return CustomCupertinoListTile(checkIsList: false, item: user, mobileNumber: _mobileNumber);
      //                   },
      //                 );
      //               })
      //             ),
      //           ),
      //           Container(
      //             padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.35),
      //             child: Consumer<UserProvider>(
      //               builder: ((context, userElement, child) {
      //                 // final List<HiveUsers> listUser = userElement.userBox as List<HiveUsers>;

      //                 final Box<dynamic> listBox = userElement.userBox;
      //                 getUserList = listBox.values.toList();
      //                 // getUserList = listUser.toList();
      //                 // getUserList = listUser;

      //                 // userElement.userBox.values.length;

      //                 return ListView.builder(
      //                   shrinkWrap: true,
      //                   padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.08),
      //                   // padding: Utils.customEdgeInsets(context, 0.08),
      //                   itemCount: listBox.length,
      //                   // itemCount: userElement.userBox.values.length,
      //                   physics: const ClampingScrollPhysics(),
      //                   itemBuilder: (context, index) {
      //                     final item = getUserList[index];
      //                     return CustomCupertinoListTile(checkIsList: true, item: item, mobileNumber: '');
      //                   },
      //                 );
      //               }),
      //             ),
      //           ),
      //         ],
      //       );
      //     } else {
      //       return SignIn();
      //     }
      //   },
      // ),
    );
  }
}
