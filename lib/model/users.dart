import 'package:flutter/cupertino.dart';
import 'package:ios_chatapp/shared/style.dart';

class User {
  String userId;
  String name;
  Color color;

  User({
    required this.userId,
    required this.name,
    required this.color
  });

  factory User.from(User user) {
    return User(
      userId: user.userId,
      name: user.name,
      color: user.color
    );
  }

  factory User.initialData() {
    return User(
      userId: '',
      name: '',
      color: Color(defaultColor)
    );
  }
}
