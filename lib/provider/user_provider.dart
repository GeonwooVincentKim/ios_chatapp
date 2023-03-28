import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:ios_chatapp/data/users.dart';
import 'package:ios_chatapp/model/hive_users.dart';
import 'package:ios_chatapp/model/users.dart';
import 'package:ios_chatapp/shared/utils.dart';

class UserProvider with ChangeNotifier {
  final userBox = Hive.box('user_db');
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
  late HiveUsers _getSingleUserHive;
  // late User _getMyInfo;
  final User _getMyInfo = User(userId: Utils.getRandomString(2), name: 'You', color: CupertinoColors.activeGreen, oppositeColor: '', phoneNumber: '');
  // final HiveUsers _getMyInfoHive = HiveUsers(userId: Utils.getRandomString(2), name: 'You', color: '', oppositeColor: '', phoneNumber: '');
  final HiveUsers _getMyInfoHive = HiveUsers(userId: Utils.getRandomString(2), name: 'You', phoneNumber: '');
  

  // ignore: unnecessary_null_comparison
  User? get getSingleUser => _getSingleUser != null ? User.from(_getSingleUser) : null;
  HiveUsers? get getSingleUserHive => _getSingleUserHive != null ? HiveUsers.from(_getSingleUserHive) : null;
  
  User get getMyInfo => User.from(_getMyInfo);
  HiveUsers get getMyInfoHive => HiveUsers.from(_getMyInfoHive);
  
  // User? get getMyInfo => _getMyInfo != null ? User.from(_getMyInfo) : null;

  void selectUser(User user) {
    _getSingleUser = user;
    // userBox.get('userId');
    // userBox.get('name');
    notifyListeners();
  }

  void selectUserHive(HiveUsers user) {
    // _getSingleUserHive = user;
    userBox.get(user);
    // userBox.get('userId');
    // userBox.get('name');
    notifyListeners();
  }

  void addUser(Map<dynamic, dynamic> userData) {
    userData['userId'] = Utils.getRandomString(2);
    final User userSets = User.fromJson(userData);
    final HiveUsers hiveUsersSets = HiveUsers.fromJson(userData);

    // changeColor();

    print("Get UserID -> ${userData['userId']}");
    _userList.add(userSets);
    // _hiveUserList.add(hiveUsersSets);
    userBox.add(hiveUsersSets);
    print(userBox.length);
    
    notifyListeners();
  }

  // Future<void> addData(Map<dynamic, dynamic> userData) {
  //   final box = await Hive.openBox()
  // }

  void updateUser(Map<String, dynamic> userData) {
    final User userUpdates = User.fromJson(userData);
    final HiveUsers hiveUserUpdates = HiveUsers.fromJson(userData);

    print("Get updates -> $userUpdates");
    print("Get updates (H) -> $hiveUserUpdates");

    print("Get ID (F) -> ${userUpdates.userId}");
    print("Get ID (F-H) -> ${hiveUserUpdates.userId}");

    // final User userUpdates = User.from(_getSingleUser);
    // User userUpdates = User(userId: _getSingleUser.userId, );
    // final int index = _userList.indexWhere((element) => element.userId == userUpdates.userId);
    final int index = _userList.indexWhere((element) => element.userId == userUpdates.userId);
    final int hiveIndex = _userList.indexWhere((element) => element.userId == hiveUserUpdates.userId);

    print("Get ID (B) -> ${userUpdates.userId}");
    print("Get ID (B-H) -> ${hiveUserUpdates.userId}");

    print("Get Index -> $index");
    print("Get Index -> $hiveIndex");

    _userList[index] = userUpdates;
    _hiveUserList[index] = hiveUserUpdates;

    // userBox.put('userId', userUpdates);
    userBox.put(userData['userId'], hiveUserUpdates);

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

  void deleteHiveUser(HiveUsers user) {
    final HiveUsers getUser = HiveUsers.from(user);
    print("Get User~! -> $getUser");
    print("Get User~! -> ${getUser.userId}");

    final int index = _userList.indexWhere((element) => element.userId == getUser.userId);

    print("Get ID (B, gg) -> ${getUser.userId}");
    print("Get Index -> $index");

    // _hiveUserList.removeAt(index);
    userBox.delete(index);
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
