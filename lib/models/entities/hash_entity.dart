import 'dart:typed_data';

import 'package:hive/hive.dart';
import 'package:image_hasher/models/hash.dart';

part 'hash_entity.g.dart';

extension HashModelMapper on HashModel {
  HashEntity asEntity() {
    return HashEntity(
      resolution: resolution,
      depth: depth,
      hashList: hashList,
    );
  }
}

extension HashEntityMapper on HashEntity {
  HashModel asModel() {
    return HashModel(
      resolution: resolution,
      depth: depth,
      hashList: hashList,
    );
  }
}

@HiveType(typeId: 0)
class HashEntity {
  /// In how many the 255 is divided
  @HiveField(0)
  final int depth;

  /// Array of hash bytes
  @HiveField(1)
  final Uint8List hashList;

  @HiveField(2)
  final int resolution;

  const HashEntity({
    required this.resolution,
    required this.depth,
    required this.hashList,
  });
}
