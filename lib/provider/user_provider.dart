import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:ios_chatapp/data/users.dart';
import 'package:ios_chatapp/model/users.dart';
import 'package:ios_chatapp/shared/utils.dart';

class UserProvider with ChangeNotifier {
  final List<User> _filteredUsers = DUMMY_USERS.toList();
  
  final List<User> _userList = [];
  // Color _backgroundColor = CupertinoColors.white;

  List<User> get filteredUsers => [..._filteredUsers];
  List<User> get userList => [..._userList];
  Utils getUtils = Utils();
  // Color get backgroundColor => _backgroundColor;

  late User _getSingleUser;
  // late User _getMyInfo;
  final User _getMyInfo = User(userId: Utils.getRandomString(2), name: 'You', color: '', oppositeColor: '', phoneNumber: '');
  
  // ignore: unnecessary_null_comparison
  User? get getSingleUser => _getSingleUser != null ? User.from(_getSingleUser) : null;
  User get getMyInfo => User.from(_getMyInfo);
  // User? get getMyInfo => _getMyInfo != null ? User.from(_getMyInfo) : null;

  void selectUser(User user) {
    _getSingleUser = user;
    notifyListeners();
  }

  void addUser(Map<dynamic, dynamic> userData) {
    userData['userId'] = Utils.getRandomString(2);
    final User userSets = User.fromJson(userData);

    // changeColor();

    print("Get UserID -> ${userData['userId']}");
    _userList.add(userSets);
    notifyListeners();
  }

  void updateUser(Map<String, dynamic> userData) {
    final User userUpdates = User.fromJson(userData);
    print("Get updates -> $userUpdates");
    print("Get ID (F) -> ${userUpdates.userId}");

    // final User userUpdates = User.from(_getSingleUser);
    // User userUpdates = User(userId: _getSingleUser.userId, );
    // final int index = _userList.indexWhere((element) => element.userId == userUpdates.userId);
    final int index = _userList.indexWhere((element) => element.userId == userUpdates.userId);

    print("Get ID (B) -> ${userUpdates.userId}");
    print("Get Index -> $index");

    _userList[index] = userUpdates;

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
