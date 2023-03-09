import 'package:flutter/cupertino.dart';
import 'package:ios_chatapp/model/users.dart';

class AddCallPage extends StatefulWidget {
  final String callInfo;
  const AddCallPage({super.key, required this.callInfo});

  @override
  State<AddCallPage> createState() => _AddCallPageState();
}

class _AddCallPageState extends State<AddCallPage> {
  late User callUser;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final value = MediaQuery.of(context).size.height / 2;
    final _controller = TextEditingController();

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text(widget.callInfo)),
      child: Container(
        alignment: Alignment.center,
        color: CupertinoColors.systemGroupedBackground,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Padding(
              //   padding: EdgeInsets.all(value),
              //   child: Row(
              //     children: const [
              //       Expanded(child: Text("Test")),
              //       Expanded(child: Text("Test"))
              //       // TextFormField()
              //     ],
              //   ),
              // )
              // CupertinoTextFormFieldRow(
              //   controller: controller,
              //   decoration: InputDecoration(

              //   )
              // )
              CupertinoFormSection.insetGrouped(
                header: Text('Enter your name:'),
                children: [
                  CupertinoTextFormFieldRow(
                    prefix: Icon(
                      CupertinoIcons.person,
                      color: CupertinoColors.systemGrey,
                    ),
                    placeholder: 'Name',
                    controller: _controller,
                  ),
                ],
              ),
              CupertinoFormSection.insetGrouped(
                header: Text('Enter your Phone Number:'),
                children: [
                  CupertinoTextFormFieldRow(
                    prefix: Icon(
                      CupertinoIcons.person,
                      color: CupertinoColors.systemGrey,
                    ),
                    placeholder: 'Name',
                    controller: _controller,
                  ),
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     Container(
              //       child: CupertinoTextFormFieldRow(
              //         prefix: Icon(
              //           CupertinoIcons.person,
              //           color: CupertinoColors.systemGrey,
              //         ),
              //         placeholder: 'Name',
              //         controller: _controller
              //       ),
              //     ),
              //   ],
              // )
              // Row(
              //   children: [
              //     Container(
              //       width: MediaQuery.of(context).size.width * 0.5,
              //       // child: CupertinoFormSection.insetGrouped(
              //       //   header: Text("Enter your name"),
              //       //   children: [
              //           child: CupertinoTextFormFieldRow(
              //             prefix: Icon(
              //               CupertinoIcons.person,
              //               color: CupertinoColors.systemGrey,
              //             ),
              //             placeholder: 'Name',
              //             controller: _controller
              //           )
              //       //   ],
              //       // )
              //     )
              //   ]
              // )
              // Text(widget.callInfo.)
            ],
          ),
        ),
      ),
    );
  }
}
