import 'dart:ui';

import 'package:hive/hive.dart';
import 'package:ios_chatapp/shared/style.dart';
part 'hive_users.g.dart';

@HiveType(typeId: 0)
class HiveUsers extends HiveObject {
  @HiveField(0)
  final dynamic userId;

  @HiveField(1)
  final String name;

  // @HiveField(2)
  // final String color;

  // @HiveField(3)
  // final String oppositeColor;

  @HiveField(2)
  final String phoneNumber;

  HiveUsers({
    required this.userId,
    required this.name,
    // required this.color,
    // required this.oppositeColor,
    required this.phoneNumber
  });

  factory HiveUsers.from(HiveUsers user) {
    return HiveUsers(
      userId: user.userId,
      name: user.name,
      // color: user.color,
      // oppositeColor: user.oppositeColor,
      phoneNumber: user.phoneNumber
    );
  }

  factory HiveUsers.fromJson(Map<dynamic, dynamic> json) {
    return HiveUsers(
      userId: json['userId'] as dynamic,
      name: json['name'] as String,
      // color: json['color'] as String,
      // oppositeColor: json['oppositeColor'] as String,
      phoneNumber: json['phoneNumber'] as String
    );
  }

  factory HiveUsers.initialData() {
    return HiveUsers(
      userId: '',
      name: '',
      // color: const Color(defaultColor) as String,
      // oppositeColor: const Color(defaultColor) as String,
      phoneNumber: ''
    );
  }
}
