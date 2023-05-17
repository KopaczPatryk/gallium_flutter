// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hash_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HashEntityAdapter extends TypeAdapter<HashEntity> {
  @override
  final int typeId = 0;

  @override
  HashEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HashEntity(
      resolution: fields[2] as int,
      depth: fields[0] as int,
      hashList: fields[1] as Uint8List,
    );
  }

  @override
  void write(BinaryWriter writer, HashEntity obj) {
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
      other is HashEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
