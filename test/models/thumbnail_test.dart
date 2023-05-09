import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:gallium_flutter/models/thumbnail_image.dart';

void main() {
  test('Identical thumbnails are equal', () {
    final t0 = ThumbnailImage.file(File('a'));
    final t1 = ThumbnailImage.file(File('b'));

    expect(t0, isNot(equals(t1)));
  });
}
