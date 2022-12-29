import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ios_chatapp/feature/app_screens/first_tab_page.dart';
import 'package:ios_chatapp/feature/app_screens/second_tab_page.dart';
import 'package:ios_chatapp/feature/utils.dart';
import 'package:ios_chatapp/model/users.dart';
import 'package:ios_chatapp/provider/user_provider.dart';

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({super.key, required this.title});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  late StreamSubscription subscription;
  TabController? controller;
  // List<User> userList = List.empty(growable: true);


  @override
  void initState() {
    super.initState();
    subscription = Connectivity().onConnectivityChanged.listen(showConnectivitySnackBar);

    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    subscription.cancel();
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // body: Center(
      //   child: ElevatedButton(
      //     style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(12)),
      //     child: const Text('Check Connection', style: TextStyle(fontSize: 20)),
      //     onPressed: () async {
      //       final result = await Connectivity().checkConnectivity();
      //       showConnectivitySnackBar(result);
      //     },
      //   )
      // )
      body: TabBarView(
        controller: controller,
        children: const [
          FirstTabPage(),
          SecondTabPage()
        ],
      ),
      bottomNavigationBar: TabBar(
        tabs: const <Tab>[
          Tab(
            icon: Icon(Icons.looks_one, color: Colors.blue),
          ),
          Tab(
            icon: Icon(Icons.looks_two, color: Colors.blue),
          )
        ],
        controller: controller,
      ),
    );
  }

  void showConnectivitySnackBar(ConnectivityResult result) {
    final hasInternet = result != ConnectivityResult.none;
    final message = hasInternet
      ? 'You have again ${result.toString()}'
      : 'You have no internet';
    
    final color = hasInternet ? Colors.green : Colors.red;
    Utils.showTopSnackBar(context, message, color);
  }
}
