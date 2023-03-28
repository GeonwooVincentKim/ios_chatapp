// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_users.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveUsersAdapter extends TypeAdapter<HiveUsers> {
  @override
  final int typeId = 0;

  @override
  HiveUsers read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveUsers(
      userId: fields[0] as dynamic,
      name: fields[1] as String,
      phoneNumber: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveUsers obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.phoneNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveUsersAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
