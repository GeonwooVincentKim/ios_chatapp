import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:ios_chatapp/model/users.dart';
import 'package:ios_chatapp/provider/user_provider.dart';
import 'package:ios_chatapp/shared/utils.dart';
import 'package:ios_chatapp/widgets/custom/form/custom_cupertino_form_section.dart';
import 'package:provider/provider.dart';

class EditCallPage extends StatefulWidget {
  final String callInfo;
  // final User getUser;
  // final Map<dynamic, dynamic> getUser;
  const EditCallPage({
    super.key, 
    required this.callInfo,
    // required this.getUser
  });

  @override
  State<EditCallPage> createState() => _EditCallPageState();
}

class _EditCallPageState extends State<EditCallPage> {
  // Color _randomColor = CupertinoColors.black;
  final random = Random();
  
  int randomValue = 0;
  int red = 0;
  int green = 0;
  int blue = 0;

  late Color color;
  late Color oppositeColor;

  TextEditingController nameController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> modifyUser = {
    'name': '',
    'color': '',
    'oppositeColor': '',
    'phoneNumber': '',
  };
  
  @override
  void initState() {
    final User getUser = Provider.of<UserProvider>(context, listen: false).getSingleUser!;

    // if (getUser != null) {
      // Don't forget to get `userId` when you use Map
      modifyUser['userId'] = getUser.userId;
      modifyUser['name'] = getUser.name;

      // Make sure to write down all attributes even not use in this page
      // color & oppositeColor
      modifyUser['color'] = getUser.color;
      modifyUser['oppositeColor'] = getUser.oppositeColor;
      modifyUser['phoneNumber'] = getUser.phoneNumber;
    // }

    nameController = TextEditingController(text: getUser.name);
    phoneController = TextEditingController(text: getUser.phoneNumber);

    // randomValue = random.nextInt(256);
    // color = Color.fromARGB(255, randomValue, randomValue, randomValue);
    
    // red = 255 - color.red;
    // green = 255 - color.green;
    // blue = 255 - color.blue;

    // oppositeColor = Color.fromRGBO(red, green, blue, 1.0);

    print("Get User ID (Obj) -> ${getUser.userId}");
    print("Get User ID (Map) -> ${modifyUser['userId']}");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final value = MediaQuery.of(context).size.height / 2;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text(widget.callInfo)),
      child: Container(
        alignment: Alignment.center,
        color: CupertinoColors.systemGroupedBackground,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomCupertinoFormSection(
                  isNameInput: true, 
                  controller: nameController,
                  onSaved: (value) {
                    modifyUser['name'] = value;
                  },
                  validator: (value) {
                    return null;
                  },
                ),
                CustomCupertinoFormSection(
                  isNameInput: false, 
                  controller: phoneController,
                  onSaved: (value) {
                    modifyUser['phoneNumber'] = value;
                  },
                  validator: (value) {
                    return null;
                  }
                ),
                // modifyUser['color'] = Utils.getRandomColor as Widget,
                CupertinoActionSheet(
                  actions: [
                    CupertinoActionSheetAction(
                      child: const Text("OK"),
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) return;
                        _formKey.currentState!.save();
                        
                        // modifyUser['color'] = Color(Random().nextInt(0xffffffff)).withOpacity(1.0);
                        // modifyUser['oppositeColor'] = Color(Random().nextInt(0xffffffff)).withOpacity(1.0);
                        // Provider.of<UserProvider>(context, listen: false).changeColor();
                        // Provider.of<UserProvider>(context, listen: false).setColor(color);
                        Provider.of<UserProvider>(context, listen: false).updateUser(modifyUser);
                        // Navigator.pop(context);
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                  cancelButton: CupertinoActionSheetAction(
                    child: const Text("Cancel"),
                    onPressed: () {
                      Navigator.of(context).pop();
                      // Navigator.pop(context);
                    }
                  ),
                )
                // CupertinoTabScaffold(
                //   tabBar: CupertinoTabBar(
                //     items: [
                //       BottomNavigationBarItem(icon: Icon(CupertinoIcons.nosign), label: 'Cancel'),
                //       BottomNavigationBarItem(icon: Icon(CupertinoIcons.add), label: 'Save'),
                //     ]
                //   ),
                //   tabBuilder: (BuildContext context, index) {
    
                //   },
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void submit() {
    
  }
}
