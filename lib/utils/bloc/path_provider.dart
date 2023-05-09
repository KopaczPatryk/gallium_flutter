import 'package:gallium_flutter/cfg/configuration.dart';
import 'package:path/path.dart' as p;

class PathProvider {
  final Configuration _configuration;

  const PathProvider({
    required Configuration configuration,
  }) : _configuration = configuration;

  String getSourceImagePath({
    required String filename,
  }) {
    final path = p.joinAll([
      _configuration.basePath,
      filename,
    ]);
    return path;
  }

  String getThumbnailImagePath({
    required String filename,
  }) {
    final path = p.joinAll([
      _configuration.basePath,
      _configuration.thumbnailsFolder,
      filename,
    ]);
    return path;
  }
}
