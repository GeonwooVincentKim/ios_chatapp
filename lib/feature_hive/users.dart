import 'package:hive/hive.dart';
import 'package:ios_chatapp/feature_hive/users.g.dart';

@HiveType(typeId: 0)
class Users extends HiveObject {
  @HiveField(0)
  final String userId;

  @HiveField(1)
  final String text;

  Users(this.userId, this.text);
}
