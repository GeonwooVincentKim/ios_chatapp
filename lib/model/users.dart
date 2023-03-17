import 'package:flutter/cupertino.dart';
import 'package:ios_chatapp/shared/style.dart';

class User {
  final String userId;
  final String name;
  final dynamic color;
  final dynamic oppositeColor;
  final String phoneNumber;

  User({
    required this.userId,
    required this.name,
    required this.color,
    required this.oppositeColor,
    required this.phoneNumber
  });

  factory User.from(User user) {
    return User(
      userId: user.userId,
      name: user.name,
      color: user.color,
      oppositeColor: user.oppositeColor,
      phoneNumber: user.phoneNumber
    );
  }

  factory User.fromJson(Map<dynamic, dynamic> json) {
    return User(
      userId: json['userId'] as String,
      name: json['name'] as String,
      color: json['color'] as dynamic,
      oppositeColor: json['oppositeColor'] as dynamic,
      phoneNumber: json['phoneNumber'] as String
    );
  }

  factory User.initialData() {
    return User(
      userId: '',
      name: '',
      color: const Color(defaultColor),
      oppositeColor: const Color(defaultColor),
      phoneNumber: ''
    );
  }
}
