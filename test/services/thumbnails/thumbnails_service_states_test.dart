import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:gallium_flutter/models/thumbnail.dart';
import 'package:gallium_flutter/services/thumbnails/thumbnails_service_states.dart';

void main() {
  test('State with same thumbnail is equal', () {
    final t = Thumbnail(file: File('a'));
    final a = GeneratedThumbnailState(allThumbnails: [t], newThumbnail: t);
    final b = GeneratedThumbnailState(allThumbnails: [t], newThumbnail: t);

    expect(a, equals(b));
  });
  test('State with diff thumbnails is not equal', () {
    final t0 = Thumbnail(file: File('a'));
    final t1 = Thumbnail(file: File('b'));
    final a = GeneratedThumbnailState(allThumbnails: [t0], newThumbnail: t0);
    final b =
        GeneratedThumbnailState(allThumbnails: [t0, t1], newThumbnail: t1);

    expect(a, isNot(equals(b)));
  });

  test('State with identical thumbnail is equal', () {
    final t0 = Thumbnail(file: File('a'));
    final t1 = Thumbnail(file: File('a'));
    final a = GeneratedThumbnailState(allThumbnails: [t0], newThumbnail: t0);
    final b = GeneratedThumbnailState(allThumbnails: [t1], newThumbnail: t1);

    expect(a, equals(b));
  });
  test('State with not identical thumbnail is not equal', () {
    final t0 = Thumbnail(file: File('a'));
    final t1 = Thumbnail(file: File('b'));
    final a = GeneratedThumbnailState(allThumbnails: [t0], newThumbnail: t0);
    final b = GeneratedThumbnailState(allThumbnails: [t1], newThumbnail: t1);

    expect(a, isNot(equals(b)));
  });
}
