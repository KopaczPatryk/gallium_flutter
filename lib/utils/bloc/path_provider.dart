import 'package:gallium_flutter/cfg/configuration.dart';
import 'package:gallium_flutter/repositories/preferences_repository/preference_manager.dart';
import 'package:gallium_flutter/utils/mixins/preferences_mixin.dart';
import 'package:path/path.dart' as p;

class PathProvider with PreferencesMixin {
  final Configuration _configuration;

  @override
  PreferenceManager preferencesRepository;

  PathProvider({
    required this.preferencesRepository,
    required Configuration configuration,
  }) : _configuration = configuration;

  String getSourceFolderPath() {
    return workspacePath!;
  }

  String getSourceImagePath({
    required String filename,
  }) {
    final path = p.joinAll([
      workspacePath!,
      filename,
    ]);
    return path;
  }

  String getThumbnailFolderPath() {
    final path = p.joinAll([
      workspacePath!,
      _configuration.thumbnailsFolder,
    ]);
    return path;
  }

  String getThumbnailImagePath({
    required String filename,
  }) {
    final path = p.joinAll([
      workspacePath!,
      _configuration.thumbnailsFolder,
      filename,
    ]);
    return path;
  }

  String getDatabasePath() {
    final path = p.joinAll([
      workspacePath!,
      _configuration.databaseFolder,
    ]);
    return path;
  }
}
