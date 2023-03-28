import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:ios_chatapp/model/hive_users.dart';
import 'package:ios_chatapp/model/users.dart';
import 'package:ios_chatapp/provider/user_provider.dart';
import 'package:ios_chatapp/shared/utils.dart';
import 'package:ios_chatapp/widgets/custom/form/custom_cupertino_form_section.dart';
import 'package:provider/provider.dart';

class AddCallPage extends StatefulWidget {
  final String callInfo;
  const AddCallPage({super.key, required this.callInfo});

  @override
  State<AddCallPage> createState() => _AddCallPageState();
}

class _AddCallPageState extends State<AddCallPage> {
  // late User callUser;
  late HiveUsers callUser;

  // Color _randomColor = CupertinoColors.black;
  final random = Random();
  
  int randomValue = 0;
  int red = 0;
  int green = 0;
  int blue = 0;

  late Color color;
  late Color oppositeColor;

  final nameController = TextEditingController();
  final colorController = TextEditingController();
  final phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> newUser = {
    'name': '',
    'color': '',
    'oppositeColor': '',
    'phoneNumber': '',
  };
  
  @override
  void initState() {
    randomValue = random.nextInt(256);
    color = Color.fromARGB(255, randomValue, randomValue, randomValue);
    
    red = 255 - color.red;
    green = 255 - color.green;
    blue = 255 - color.blue;

    oppositeColor = Color.fromRGBO(red, green, blue, 1.0);

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
                    newUser['name'] = value;
                  },
                  validator: (value) {
                    return null;
                  },
                ),
                CustomCupertinoFormSection(
                  isNameInput: false, 
                  controller: phoneController,
                  onSaved: (value) {
                    newUser['phoneNumber'] = value;
                  },
                  validator: (value) {
                    return null;
                  }
                ),
                // newUser['color'] = Utils.getRandomColor as Widget,
                CupertinoActionSheet(
                  actions: [
                    CupertinoActionSheetAction(
                      child: const Text("OK"),
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) return;
                        _formKey.currentState!.save();
                        
                        newUser['color'] = Color(Random().nextInt(0xffffffff)).withOpacity(1.0);
                        newUser['oppositeColor'] = Color(Random().nextInt(0xffffffff)).withOpacity(1.0);
                        // Provider.of<UserProvider>(context, listen: false).changeColor();
                        // Provider.of<UserProvider>(context, listen: false).setColor(color);
                        Provider.of<UserProvider>(context, listen: false).addUser(newUser);
                        Navigator.pop(context);
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
