// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emuser.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EmUserAdapter extends TypeAdapter<EmUser> {
  @override
  final int typeId = 1;

  @override
  EmUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EmUser()
      ..emUserName = fields[0] as String
      ..emMobile = fields[1] as String
      ..emEmail = fields[2] as String
      ..emUserId = fields[3] as String
      ..emPassword = fields[4] as String
      ..emAuthenticated = fields[5] as bool;
  }

  @override
  void write(BinaryWriter writer, EmUser obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.emUserName)
      ..writeByte(1)
      ..write(obj.emMobile)
      ..writeByte(2)
      ..write(obj.emEmail)
      ..writeByte(3)
      ..write(obj.emUserId)
      ..writeByte(4)
      ..write(obj.emPassword)
      ..writeByte(5)
      ..write(obj.emAuthenticated);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
