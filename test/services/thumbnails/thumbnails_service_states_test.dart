import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gallium_flutter/models/thumbnail_image.dart';
import 'package:gallium_flutter/services/thumbnails/thumbnails_state.dart';

void main() {
  test('State with same thumbnail is equal', () {
    final t = ThumbnailImage(
      fileImage: FileImage(
        File('a'),
      ),
    );
    final a = GeneratedThumbnailState(
      allThumbnails: [t],
      newThumbnail: t,
    );
    final b = GeneratedThumbnailState(
      allThumbnails: [t],
      newThumbnail: t,
    );

    expect(a, equals(b));
  });
  test('State with diff thumbnails is not equal', () {
    final t0 = ThumbnailImage(
      fileImage: FileImage(
        File('a'),
      ),
    );
    final t1 = ThumbnailImage(
      fileImage: FileImage(
        File('b'),
      ),
    );
    final a = GeneratedThumbnailState(
      allThumbnails: [t0],
      newThumbnail: t0,
    );
    final b = GeneratedThumbnailState(
      allThumbnails: [t0, t1],
      newThumbnail: t1,
    );

    expect(a, isNot(equals(b)));
  });

  test('State with identical thumbnail is equal', () {
    final t0 = ThumbnailImage(
      fileImage: FileImage(
        File('a'),
      ),
    );
    final t1 = ThumbnailImage(
      fileImage: FileImage(
        File('a'),
      ),
    );
    final a = GeneratedThumbnailState(
      allThumbnails: [t0],
      newThumbnail: t0,
    );
    final b = GeneratedThumbnailState(
      allThumbnails: [t1],
      newThumbnail: t1,
    );

    expect(a, equals(b));
  });
  test('State with not identical thumbnail is not equal', () {
    final t0 = ThumbnailImage(
      fileImage: FileImage(
        File('a'),
      ),
    );
    final t1 = ThumbnailImage(
      fileImage: FileImage(
        File('b'),
      ),
    );
    final a = GeneratedThumbnailState(
      allThumbnails: [t0],
      newThumbnail: t0,
    );
    final b = GeneratedThumbnailState(
      allThumbnails: [t1],
      newThumbnail: t1,
    );

    expect(a, isNot(equals(b)));
  });
}
