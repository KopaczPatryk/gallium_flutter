import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:image_hasher/models/hash.dart';
import 'package:image_hasher/models/hashlet.dart';

import 'package:image_hasher/utils/color_space_converter.dart';

class ImageHasher {
  final int size;
  final int depth;

  final int _depthDivider;

  const ImageHasher({
    this.size = 32,
    this.depth = 8,
  }) : _depthDivider = 256 ~/ depth;

  Hashlet _colorToHashlet(Color color) => Hashlet(
        r: color.red ~/ _depthDivider,
        g: color.green ~/ _depthDivider,
        b: color.blue ~/ _depthDivider,
        a: color.alpha ~/ _depthDivider,
      );

  Hash getImageHash(img.Image src) {
    final image = img.copyResize(src, width: size, height: size);

    final hash = Hash(hashDepth: depth);

    for (var x = 0; x < image.width; x++) {
      for (var y = 0; y < image.height; y++) {
        final intPixel = image.getPixel(x, y);

        final px = Color(abgrToArgb(intPixel));
        final hashlet = _colorToHashlet(px);
        hash.add(hashlet);
      }
    }
    return hash;
  }
}
