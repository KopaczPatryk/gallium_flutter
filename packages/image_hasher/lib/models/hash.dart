import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:image_hasher/models/hashlet.dart';

part 'hash.g.dart';

@HiveType(typeId: 0)
class Hash extends HiveObject with EquatableMixin {
  /// In how many the 255 is divided
  @HiveField(0)
  final int depth;

  /// Array of hash bytes
  @HiveField(1)
  final Uint8List hashList;

  @HiveField(2)
  final int resolution;

  int get length => hashList.length;

  @override
  List<Object> get props => [
        depth,
        hashList,
      ];

  Hash({
    required this.resolution,
    required this.depth,
  }) : hashList = Uint8List(resolution * resolution * 4);

  Hashlet operator [](int index) {
    final int baseIndex = index * 4;
    return Hashlet(
      r: baseIndex,
      g: baseIndex + 1,
      b: baseIndex + 2,
      a: baseIndex + 3,
    );
  }

  operator []=(int i, Hashlet value) {
    final baseIndex = i * 4;
    hashList[baseIndex] = value.r;
    hashList[baseIndex + 1] = value.g;
    hashList[baseIndex + 2] = value.b;
    hashList[baseIndex + 3] = value.a;
  }
}
