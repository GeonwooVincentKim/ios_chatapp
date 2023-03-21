import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:phone_selector/phone_selector.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _phoneNumber = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              "Phone Number",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              _phoneNumber,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 40,
            ),
            CupertinoButton(
              onPressed: () {
                _getPhoneNumber();
              },
              child: Text("Get Phone Number"),
            )
          ],
        ),
      )
  );
  }

  _getPhoneNumber() async {
    String? phoneNumber;

    try {
      phoneNumber = await PhoneSelector.getPhoneNumber();
      print(phoneNumber);
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
}