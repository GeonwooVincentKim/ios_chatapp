import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ios_chatapp/app_screens/call/add_call_page.dart';
import 'package:ios_chatapp/app_screens/call/edit_call_page.dart';
import 'package:ios_chatapp/app_screens/chat/chat_page.dart';
import 'package:ios_chatapp/app_screens/chat/other_user_profile.dart';
import 'package:ios_chatapp/app_screens/cupertino_call.dart';
import 'package:ios_chatapp/app_screens/page_not_found.dart';
import 'package:ios_chatapp/body.dart';
import 'package:ios_chatapp/feature_hive/hive_helper.dart';
import 'package:ios_chatapp/model/hive_users.dart';
import 'package:ios_chatapp/provider/user_provider.dart';
import 'package:ios_chatapp/shared/style.dart';
import 'package:ios_chatapp/widgets/custom/tile/user_detail.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart' as path;

final List<HiveUsers> _items = [];

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(HiveUsersAdapter());
  await HiveHelper().openBox();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('New Task'),
          content: TextField(
            autofocus: true,
            onSubmitted: (String text) {
              setState(() {
                HiveHelper().create(HiveUsers(userId: '', name: 'testing', color: Colors.amber, oppositeColor: Colors.amber, phoneNumber: ''));
              });
              Navigator.of(context).pop();
            },
            textInputAction: TextInputAction.send,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<HiveUsers>>(
      future: HiveHelper().read(),
      builder: (context, snapshot) {
        List tasks = snapshot.data ?? [];

        return Scaffold(
          appBar: AppBar(title: const Text('To do')),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _showMyDialog();
            },
          ),
          body: ReorderableListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            proxyDecorator: (Widget child, int index, Animation<double> animation) {
              return TaskTile(task: tasks[index], onDeleted: () {});
            },
            children: <Widget>[
              for (int index = 0; index < tasks.length; index += 1)
                Padding(
                  key: Key('$index'),
                  padding: const EdgeInsets.all(8.0),
                  child: TaskTile(
                    task: tasks[index],
                    onDeleted: () {
                      setState(() {});
                    },
                  ),
                )
            ],
            onReorder: (int oldIndex, int newIndex) async {
              // if (oldIndex < newIndex) {
              //   newIndex -= 1;
              // }

              // await HiveHelper().reOrder(oldIndex, newIndex);
              // setState(() {});
            },
          ),
        );
      }
    );
  }
}

class TaskTile extends StatefulWidget {
  TaskTile({
    Key? key,
    required this.task,
    required this.onDeleted,
  }) : super(key: key);

  final HiveUsers task;
  final Function onDeleted;

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color evenItemColor = colorScheme.primary;

    return Material(
      child: AnimatedContainer(
        constraints: const BoxConstraints(minHeight: 60),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: evenItemColor,
          borderRadius: BorderRadius.circular(12),
        ),
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
        child: Row(
          children: [
            // Checkbox(
            //   key: widget.key,
            //   value: widget.task,
            //   onChanged: (checked) {
            //     widget.task.finished = checked!;
            //     widget.task.save();

            //     setState(() {});
            //   },
            // ),
            Expanded(
              child: Text(
                widget.task.name,
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  decoration: TextDecoration.lineThrough
                ),
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
              onPressed: () {
                widget.task.delete();
                widget.onDeleted();
              },
            )
          ],
        ),
      ),
    );
  }
}
