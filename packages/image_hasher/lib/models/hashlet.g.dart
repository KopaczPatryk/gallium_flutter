// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hashlet.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HashletAdapter extends TypeAdapter<Hashlet> {
  @override
  final int typeId = 1;

  @override
  Hashlet read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Hashlet(
      r: fields[0] as int,
      g: fields[1] as int,
      b: fields[2] as int,
      a: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Hashlet obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.r)
      ..writeByte(1)
      ..write(obj.g)
      ..writeByte(2)
      ..write(obj.b)
      ..writeByte(3)
      ..write(obj.a);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HashletAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
