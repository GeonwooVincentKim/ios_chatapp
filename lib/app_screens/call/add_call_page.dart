import 'package:flutter/cupertino.dart';
import 'package:ios_chatapp/model/users.dart';
import 'package:ios_chatapp/provider/user_provider.dart';
import 'package:ios_chatapp/widgets/custom/custom_cupertino_form_section.dart';
import 'package:provider/provider.dart';

class AddCallPage extends StatefulWidget {
  final String callInfo;
  const AddCallPage({super.key, required this.callInfo});

  @override
  State<AddCallPage> createState() => _AddCallPageState();
}

class _AddCallPageState extends State<AddCallPage> {
  late User callUser;
  Color _randomColor = CupertinoColors.black;

  final nameController = TextEditingController();
  final colorController = TextEditingController();
  final phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> newUser = {
    'name': '',
    'phoneNumber': '',
  };

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final value = MediaQuery.of(context).size.height / 2;

    return SingleChildScrollView(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(middle: Text(widget.callInfo)),
        child: Container(
          alignment: Alignment.center,
          color: CupertinoColors.systemGroupedBackground,
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
                    newUser['phone'] = value;
                  },
                  validator: (value) {
                    return null;
                  }
                ),
    
                CupertinoActionSheet(
                  actions: [
                    CupertinoActionSheetAction(
                      child: const Text("OK"),
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) return;
                        _formKey.currentState!.save();
    
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
