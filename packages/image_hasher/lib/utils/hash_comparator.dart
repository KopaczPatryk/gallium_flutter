import 'package:image_hasher/exceptions/hash_incompatibility_exception.dart';
import 'package:image_hasher/models/hash.dart';

abstract class HashComparator {
  static double compareHashes(final Hash a, final Hash b) {
    if (a.length != b.length) {
      throw HashIncompatibilityException("Hash length mismatch");
    }

    double eq = 0;
    for (int i = 0; i < a.length; i++) {
      if (a[i] == b[i]) {
        eq++;
      }
    }

    return eq / a.length;
  }

  static double compareHashesFast(final Hash a, Hash b, double threshold) {
    if (a.length != b.length) {
      throw HashIncompatibilityException("Hash length mismatch");
    }

    double eq = 0;
    for (int i = 0; i < a.length; i++) {
      if (a[i] == b[i]) {
        eq++;
      }

      if (i > 0 &&
          (eq / i < (1 - threshold) + 1) &&
          i > a.length * (1 - threshold) + 1) {
        return 0;
      }
    }

    return eq / a.length;
  }
}
