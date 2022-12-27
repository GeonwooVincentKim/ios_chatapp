import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ios_chatapp/feature/app_screens/first_tab_page.dart';
import 'package:ios_chatapp/feature/app_screens/second_tab_page.dart';
import 'package:ios_chatapp/feature/utils.dart';

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({super.key, required this.title});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  late StreamSubscription subscription;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    subscription = Connectivity().onConnectivityChanged.listen(showConnectivitySnackBar);
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: TabBarView(
        children: [
          FirstTabPage(),
          SecondTabPage()
          // ElevatedButton(
          //   style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(12)),
          //   child: const Text('Check Connection', style: TextStyle(fontSize: 20)),
          //   onPressed: () async {
          //     final result = await Connectivity().checkConnectivity();
          //     showConnectivitySnackBar(result);
          //   },
          // ),
        ],
        controller: tabController,
      ),
      bottomNavigationBar: TabBar(
        tabs: [
          Tab(icon: Icon(Icons.looks_one, color: Colors.blue)),
          Tab(icon: Icon(Icons.looks_two, color: Colors.blue))
        ],
      
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
