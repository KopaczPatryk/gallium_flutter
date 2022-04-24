// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hash.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HashAdapter extends TypeAdapter<Hash> {
  @override
  final int typeId = 0;

  @override
  Hash read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Hash(
      hashDepth: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Hash obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.hashDepth)
      ..writeByte(1)
      ..write(obj._hash);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HashAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
