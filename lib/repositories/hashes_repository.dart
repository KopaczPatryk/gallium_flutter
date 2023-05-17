import 'package:flutter/foundation.dart';
import 'package:gallium_flutter/models/entities/hash_entity.dart';
import 'package:gallium_flutter/models/source_image.dart';
import 'package:gallium_flutter/repositories/providers/database_provider.dart';
import 'package:gallium_flutter/repositories/providers/files_provider.dart';
import 'package:gallium_flutter/utils/bloc/path_provider.dart';
import 'package:hive/hive.dart';
import 'package:image/image.dart' as img;
import 'package:image_hasher/image_hasher.dart';
import 'package:image_hasher/models/hash.dart';

class HashesRepository {
  final DatabaseProvider _databaseRepo;
  final ImageHasher _imageHasher;

  const HashesRepository({
    required DatabaseProvider databaseRepo,
    required FilesProvider filesProvider,
    required PathProvider pathProvider,
  })  : _databaseRepo = databaseRepo,
        _imageHasher = const ImageHasher();

  Future<List<HashModel>> getAllHashes() async {
    final Box<HashEntity> hashBox = await _databaseRepo.getHashBox();
    final List<HashModel> allHashes = hashBox.values
        .map(
          (e) => e.asModel(),
        )
        .toList();

    return allHashes;
  }

  Future<HashModel> getHash(SourceImage sourceImage) async {
    final Box<HashEntity> box = await _databaseRepo.getHashBox();

    final HashEntity? hash = box.get(sourceImage.filename);

    if (hash != null) {
      return hash.asModel();
    }

    final img.Image image = await _openFileAsImage(sourceImage: sourceImage);
    final HashModel generatedHash = await _imageHasher.getImageHash(image);

    box.put(sourceImage.filename, generatedHash.asEntity());

    return generatedHash;
  }

  Future<img.Image> _openFileAsImage({required SourceImage sourceImage}) async {
    final Uint8List bytes = await sourceImage.fileImage.file.readAsBytes();
    final img.Image? image = img.decodeImage(bytes);

    return image!;
  }
}
