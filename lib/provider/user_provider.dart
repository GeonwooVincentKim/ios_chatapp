import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:ios_chatapp/data/users.dart';
import 'package:ios_chatapp/model/users.dart';
import 'package:ios_chatapp/shared/utils.dart';

class UserProvider with ChangeNotifier {
  final List<User> _filteredUsers = DUMMY_USERS.toList();
  final List<User> _userList = [];
  Color _backgroundColor = CupertinoColors.white;

  List<User> get filteredUsers => [..._filteredUsers];
  List<User> get userList => [..._userList];
  Utils getUtils = Utils();
  Color get backgroundColor => _backgroundColor;

  late User _getSingleUser;
  // ignore: unnecessary_null_comparison
  User? get getSingleUser => _getSingleUser != null ? User.from(_getSingleUser) : null;

  void selectUser(User user) {
    _getSingleUser = user;
    notifyListeners();
  }

  void addUser(Map<dynamic, dynamic> userData) {
    userData['userId'] = Utils.getRandomString(2);
    final User userSets = User.fromJson(userData);

    changeColor();

    print("Get UserID -> ${userData['userId']}");
    _userList.add(userSets);
    notifyListeners();
  }

  void deleteUser(int index) {
    _userList.removeAt(index);
    notifyListeners();
  }

  void setColor(Color color) {
    _backgroundColor = color;
    notifyListeners();
  }

  void changeColor() {
    _backgroundColor = Color(Random().nextInt(0xffffffff)).withOpacity(1.0);
    notifyListeners();
  }
}
