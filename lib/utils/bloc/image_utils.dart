import 'dart:io';
import 'dart:typed_data';

import 'package:gallium_flutter/cfg/configuration.dart';
import 'package:gallium_flutter/repositories/preferences_repository/preferences_repository.dart';
import 'package:gallium_flutter/utils/mixins/preferences_mixin.dart';
import 'package:image/image.dart';
import 'package:path/path.dart' as p;

class ImageUtils with PreferencesMixin {
  final Configuration _configuration;

  @override
  PreferenceManager preferencesRepository;

  ImageUtils({
    required Configuration configuration,
    required this.preferencesRepository,
  }) : _configuration = configuration;

  Image getSourceImage({
    required String filename,
  }) {
    final path = p.joinAll([
      workspacePath!,
      filename,
    ]);

    return _readImage(path: path);
  }

  Image getThumbnailImage({
    required String filename,
  }) {
    final path = p.joinAll([
      workspacePath!,
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
