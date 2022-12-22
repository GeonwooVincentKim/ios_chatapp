import 'package:flutter/cupertino.dart';
import 'package:ios_chatapp/data/users.dart';
import 'package:ios_chatapp/model/users.dart';

class UserProvider with ChangeNotifier {
  final List<User> _filteredUsers = DUMMY_USERS.toList();
  List<User> get filteredUsers => [..._filteredUsers];
}
