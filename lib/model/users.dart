import 'package:flutter/cupertino.dart';
import 'package:ios_chatapp/shared/style.dart';

class User {
  int userId;
  String name;
  Color color;

  User({
    required this.userId,
    required this.name,
    required this.color
  });

  factory User.initialData() {
    return User(
      userId: 0,
      name: '',
      color: Color(defaultColor)
    );
  }
}
