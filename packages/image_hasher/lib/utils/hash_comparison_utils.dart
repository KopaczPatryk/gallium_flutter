import 'package:image_hasher/exceptions/hash_incompatibility_exception.dart';
import 'package:image_hasher/models/hash_model.dart';

abstract class HashComparisonUtils {
  /// Compares hashes and returns similarity percentage
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

  /// Compares hashes until [threshold] mismatch is exceeded
  static bool areIdentical(
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

    int notEqualCount = 0;
    for (int i = 0; i < length; i++) {
      if (a.hashList[i] != b.hashList[i]) {
        notEqualCount++;
      }
      final mismatchPercent = notEqualCount / length;
      final acceptablePercent = 1 - threshold;
      if (mismatchPercent > acceptablePercent) {
        return false;
      }
    }
    return true;
  }
}
