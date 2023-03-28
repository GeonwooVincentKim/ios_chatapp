import 'package:hive/hive.dart';
import 'package:ios_chatapp/model/hive_users.dart';

const String HIVE_BOX = 'USER_BOX';

class HiveHelper {
  static final HiveHelper _singleton = HiveHelper._internal();

  factory HiveHelper() {
    return _singleton;
  }

  HiveHelper._internal();

  Box<HiveUsers>? userBox;

  Future openBox() async {
    userBox = await Hive.openBox(HIVE_BOX);
  }

  Future create(HiveUsers users) async {
    return userBox!.add(users);
  }

  Future<List<HiveUsers>> read() async {
    return userBox!.values.toList();
  }

  Future update(int index, HiveUsers users) async {
    userBox!.putAt(index, users);
  }
  
  Future delete(int index) async {
    userBox!.deleteAt(index);
  }
}
