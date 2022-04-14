import 'package:image/image.dart';

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

  Hashlet _colorToHashlet(int color) => Hashlet(
        r: getRed(color) ~/ _depthDivider,
        g: getGreen(color) ~/ _depthDivider,
        b: getBlue(color) ~/ _depthDivider,
        a: getAlpha(color) ~/ _depthDivider,
      );

  Hash getImageHash(Image src) {
    final image = copyResize(src, width: size, height: size);

    final hash = Hash(hashDepth: depth);

    for (var x = 0; x < image.width; x++) {
      for (var y = 0; y < image.height; y++) {
        final intPixel = image.getPixel(x, y);

        final hashlet = _colorToHashlet(abgrToArgb(intPixel));
        hash.add(hashlet);
      }
    }
    return hash;
  }
}
