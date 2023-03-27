import 'package:hive/hive.dart';
part 'hive_users.g.dart';

@HiveType(typeId: 0)
class HiveUsers extends HiveObject {
  @HiveField(0)
  final dynamic userId;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final dynamic color;

  @HiveField(3)
  final dynamic oppositeColor;

  @HiveField(4)
  final String phoneNumber;

  HiveUsers({
    required this.userId,
    required this.name,
    required this.color,
    required this.oppositeColor,
    required this.phoneNumber
  });
}
