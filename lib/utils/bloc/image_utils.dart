import 'dart:io';
import 'dart:typed_data';

import 'package:gallium_flutter/cfg/configuration.dart';
import 'package:image/image.dart';
import 'package:path/path.dart' as p;

class ImageUtils {
  final Configuration _configuration;

  const ImageUtils({
    required Configuration configuration,
  }) : _configuration = configuration;

  Image getSourceImage({
    required String filename,
  }) {
    final path = p.joinAll([
      _configuration.basePath,
      filename,
    ]);

    return _readImage(path: path);
  }

  Image getThumbnailImage({
    required String filename,
  }) {
    final path = p.joinAll([
      _configuration.basePath,
      _configuration.thumbnailsFolder,
      filename,
    ]);
    return _readImage(path: path);
  }

  Image _readImage({required String path}) {
    final File file = File(path);
    final Uint8List bytes = file.readAsBytesSync();
    final Image? image = decodeImage(bytes);
    if (image == null) {
      throw Exception('Unsupported format');
    }
    return image;
  }
}
