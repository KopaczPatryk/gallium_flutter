import 'dart:async';

import 'package:image/image.dart';

import 'models/hash.dart';
import 'models/hashlet.dart';

class ImageHasher {
  final int size;
  final int depth;

  final int _depthDivider;

  const ImageHasher({
    this.size = 32,
    this.depth = 8,
  }) : _depthDivider = 256 ~/ depth;

  Hashlet _colorToHashlet(int color) => Hashlet(
        r: getRed(color) ~/ _depthDivider,
        g: getGreen(color) ~/ _depthDivider,
        b: getBlue(color) ~/ _depthDivider,
        a: getAlpha(color) ~/ _depthDivider,
      );

  int _abgrToArgb(int abgrColor) {
    int r = (abgrColor >> 16) & 0xFF;
    int b = abgrColor & 0xFF;
    return (abgrColor & 0xFF00FF00) | (b << 16) | r;
  }

  FutureOr<Hash> getImageHash(Image src) {
    final future = Future(() {
      final image = copyResize(
        src,
        width: size,
        height: size,
      );
      final hash = Hash(
        depth: depth,
        resolution: size,
      );

      int normalizedIndex = 0;
      for (var x = 0; x < image.width; x++) {
        for (var y = 0; y < image.height; y++) {
          final abgrPixel = image.getPixel(x, y);

          final hashlet = _colorToHashlet(_abgrToArgb(abgrPixel));
          hash[normalizedIndex] = hashlet;
          normalizedIndex++;
        }
      }
      return hash;
    });

    return future;
  }
}
