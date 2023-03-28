import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:ios_chatapp/data/users.dart';
import 'package:ios_chatapp/model/hive_users.dart';
import 'package:ios_chatapp/model/users.dart';
import 'package:ios_chatapp/shared/utils.dart';


final userBox = Hive.box<HiveUsers>('user_db');

class UserProvider with ChangeNotifier {
  // final newUserBox = Hive.box('user');
  
  // Box<HiveUsers> getUserBox = [] as Box<HiveUsers>; 
  final List<User> _filteredUsers = DUMMY_USERS.toList();
  
  final List<User> _userList = [];
  final List<HiveUsers> _hiveUserList = [];
  // Color _backgroundColor = CupertinoColors.white;

  List<User> get filteredUsers => [..._filteredUsers];
  List<User> get userList => [..._userList];
  List<HiveUsers> get hiveUserList => [..._hiveUserList];

  Utils getUtils = Utils();
  // Color get backgroundColor => _backgroundColor;

  late User _getSingleUser;
  // late User _getMyInfo;
  final User _getMyInfo = User(userId: Utils.getRandomString(2), name: 'You', color: CupertinoColors.activeGreen, oppositeColor: '', phoneNumber: '');
  
  // ignore: unnecessary_null_comparison
  User? get getSingleUser => _getSingleUser != null ? User.from(_getSingleUser) : null;
  User get getMyInfo => User.from(_getMyInfo);
  // User? get getMyInfo => _getMyInfo != null ? User.from(_getMyInfo) : null;

  void selectUser(User user) {
    _getSingleUser = user;
    // userBox.get('userId');
    // userBox.get('name');
    notifyListeners();
  }
  
  // Future openBox() async {
  //   getUserBox = await Hive.openBox('user_db');
  // }

  void addUser(Map<dynamic, dynamic> userData) {
    userData['userId'] = Utils.getRandomString(2);
    final User userSets = User.fromJson(userData);
    final HiveUsers hiveUserSets = HiveUsers.fromJson(userData);

    // changeColor();

    print("Get UserID -> ${userData['userId']}");
    print("Get users Sets -> ${userSets.userId}");
    print("Get users Sets (hive) -> ${hiveUserSets.userId}");


    _userList.add(userSets);
    // userBox.add(hiveUserSets);
    userBox.put(userData['userId'], hiveUserSets);

    // userBox.add(userSets);
    // userBox.put('userId', userSets.userId);
    // userBox.put('name', userSets.name);
    // userBox.put('phoneNumber', userSets.phoneNumber);
    // userBox.put('color', userSets.color);
    // userBox.put('oppositeColor', userSets.oppositeColor);
    // newUserBox.put(userData['userId'], userSets);
    // userBox.put(userData['userId'], userSets);

    print("Get Values -> ${userBox.values.first.toString()}");
    print("Get UserBox contents -> $userBox");
    // print("Get box -> ${userBox.get('user')}");

    // userBox.add(userSets);
    notifyListeners();
  }

  // Future<void> addData(Map<dynamic, dynamic> userData) {
  //   final box = await Hive.openBox()
  // }

  void updateUser(Map<String, dynamic> userData) {
    final User userUpdates = User.fromJson(userData);
    final HiveUsers hiveUserSets = HiveUsers.fromJson(userData);

    print("Get updates -> $userUpdates");
    print("Get updates (Hive) -> $hiveUserSets");

    print("Get ID (F) -> ${userUpdates.userId}");
    print("Get ID (F-H) -> ${hiveUserSets.userId}");


    // final User userUpdates = User.from(_getSingleUser);
    // User userUpdates = User(userId: _getSingleUser.userId, );
    // final int index = _userList.indexWhere((element) => element.userId == userUpdates.userId);
    final int index = _userList.indexWhere((element) => element.userId == userUpdates.userId);
    final int indexHive = _hiveUserList.indexWhere((element) => element.userId == userUpdates.userId);

    print("Get ID (B) -> ${userUpdates.userId}");
    print("Get ID (B-H) -> ${hiveUserSets.userId}");

    print("Get Index -> $index");
    print("Get Index (Hive) -> $indexHive");


    _userList[index] = userUpdates;
    _hiveUserList[index] = hiveUserSets;
    
    userBox.put(userData['userId'], hiveUserSets);

    notifyListeners();
  }

  void deleteUser(User user) {
    final User getUser = User.from(user);
    print("Get User~! -> $getUser");
    print("Get User~! -> ${getUser.userId}");

    final int index = _userList.indexWhere((element) => element.userId == getUser.userId);

    print("Get ID (B, gg) -> ${getUser.userId}");
    print("Get Index -> $index");

    _userList.removeAt(index);
    userBox.delete('user_db');
    notifyListeners();
  }

  // void setColor(Color color) {
  //   _backgroundColor = color;
  //   notifyListeners();
  // }

  // void changeColor() {
  //   _backgroundColor = Color(Random().nextInt(0xffffffff)).withOpacity(1.0);
  //   notifyListeners();
  // }
}
