import 'package:gallium_flutter/cfg/configuration.dart';
import 'package:gallium_flutter/models/source_image.dart';
import 'package:gallium_flutter/repositories/files_provider.dart';

class PhotosRepository {
  final Configuration _configuration;
  final FilesProvider _filesProvider;

  const PhotosRepository({
    required Configuration configuration,
    required FilesProvider filesProvider,
  })  : _configuration = configuration,
        _filesProvider = filesProvider;

  Future<List<SourceImage>> getPhotos() async {
    final files = await _filesProvider.getSourceFiles();
    return files.map((e) => SourceImage(e)).toList();
  }
}
