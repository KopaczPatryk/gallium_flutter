import 'package:image_hasher/exceptions/hash_incompatibility_exception.dart';
import 'package:image_hasher/models/hash_model.dart';

abstract class HashComparisonUtils {
  static double compareHashes(final HashModel a, final HashModel b) {
    if (a.length != b.length) {
      throw const HashIncompatibilityException(
        message: 'Hash length mismatch',
      );
    }
    final int length = a.length;

    int equalCount = 0;
    for (int i = 0; i < length; i++) {
      final hashCellA = a.hashList[i];
      final hashCellB = b.hashList[i];

      if (hashCellA == hashCellB) {
        equalCount++;
      }
    }

    final percentage = equalCount / length;
    return percentage;
  }

  static double compareHashesFast(
    HashModel a,
    HashModel b,
    double threshold,
  ) {
    if (a.length != b.length) {
      throw const HashIncompatibilityException(
        message: 'Hash length mismatch',
      );
    }

    final int length = a.length;

    double equalPercent = 0;
    for (int i = 0; i < length; i++) {
      if (a[i] == b[i]) {
        equalPercent++;
      }

      if (i > 0 &&
          (equalPercent / i < (1 - threshold) + 1) &&
          i > length * (1 - threshold) + 1) {
        return 0;
      }
    }

    return equalPercent / length;
  }
}
