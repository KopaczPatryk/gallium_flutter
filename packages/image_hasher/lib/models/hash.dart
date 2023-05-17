import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:image_hasher/models/hash_cell.dart';

class HashModel with EquatableMixin {
  /// In how many the 255 is divided
  final int depth;

  /// Array of hash bytes
  final Uint8List hashList;
  final int resolution;

  int get length => hashList.length;

  @override
  List<Object> get props => [
        depth,
        hashList,
      ];

  HashModel({
    required this.resolution,
    required this.depth,
    Uint8List? hashList,
  }) : hashList = hashList ?? Uint8List(resolution * resolution * 4);

  HashCell operator [](int index) {
    final int baseIndex = index * 4;
    return HashCell(
      r: baseIndex,
      g: baseIndex + 1,
      b: baseIndex + 2,
      a: baseIndex + 3,
    );
  }

  operator []=(int i, HashCell value) {
    final baseIndex = i * 4;
    hashList[baseIndex] = value.r;
    hashList[baseIndex + 1] = value.g;
    hashList[baseIndex + 2] = value.b;
    hashList[baseIndex + 3] = value.a;
  }
}
