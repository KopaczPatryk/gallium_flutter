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
      resolution: fields[2] as int,
      depth: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Hash obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.depth)
      ..writeByte(1)
      ..write(obj.hashList)
      ..writeByte(2)
      ..write(obj.resolution);
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
