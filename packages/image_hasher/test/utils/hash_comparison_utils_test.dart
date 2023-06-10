import 'package:collection/collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_hasher/models/hash_model.dart';
import 'package:image_hasher/models/hash_unit.dart';
import 'package:image_hasher/utils/hash_comparison_utils.dart';

void main() {
  group(HashComparisonUtils, () {
    test('${HashComparisonUtils.compareHashes} correctly calculates similarity', () {
      const resolution = 4;
      const depth = 4;
      const length = resolution * resolution;
      final hashA = HashModel(resolution: resolution, depth: depth);
      final hashB = HashModel(resolution: resolution, depth: depth);

      final List<int> cells = List.filled(
        (length - 1) * depth,
        1,
      );

      // hydrate hashes with identical data
      cells.forEachIndexed((index, element) {
        hashA.hashList[index] = element;
        hashB.hashList[index] = element;
      });

      // hydrate hashes with difference at last position
      hashA[15] = const HashUnit(r: 1, g: 1, b: 1, a: 1);
      hashB[15] = const HashUnit(r: 2, g: 2, b: 2, a: 2);

      final result = HashComparisonUtils.compareHashes(hashA, hashB);

      // ye im lazy as fuck
      expect(result, lessThan(1));
      expect(result, greaterThan(0.9));
    });
  });
}
