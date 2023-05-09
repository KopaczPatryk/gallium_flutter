import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:gallium_flutter/models/source_image.dart';
import 'package:gallium_flutter/repositories/providers/database_provider.dart';
import 'package:gallium_flutter/repositories/providers/files_provider.dart';
import 'package:gallium_flutter/utils/bloc/path_provider.dart';
import 'package:hive/hive.dart';
import 'package:image_hasher/image_hasher.dart';
import 'package:image_hasher/models/hash.dart';
import 'package:image/image.dart' as img;

class HashesRepository {
  // ignore: unused_field
  final DatabaseProvider _databaseRepo;
  final FilesProvider _filesProvider;
  final ImageHasher _imageHasher;
  final PathProvider _pathProvider;

  const HashesRepository({
    required DatabaseProvider databaseRepo,
    required FilesProvider filesProvider,
    required PathProvider pathProvider,
  })  : _databaseRepo = databaseRepo,
        _imageHasher = const ImageHasher(),
        _filesProvider = filesProvider,
        _pathProvider = pathProvider;

  Future<List<Hash>> getAllHashes() async {
    final Box<Hash> hashBox = await _databaseRepo.getHashBox();
    final List<Hash> allHashes = hashBox.values.toList();

    return allHashes;
  }

  Future<Hash> getHash(SourceImage sourceImage) async {
    final Box<Hash> hashBox = await _databaseRepo.getHashBox();
    final Hash? hash = hashBox.get(sourceImage.filename);
    if (hash != null) {
      return hash;
    }

    var image = await _openFileAsImage(sourceImage: sourceImage);
    final generatedHash = await _imageHasher.getImageHash(image);

    return generatedHash;
  }

  Future<img.Image> _openFileAsImage({required SourceImage sourceImage}) async {
    final path = _pathProvider.getSourceImagePath(
      filename: sourceImage.filename,
    );
    final File file = _filesProvider.getFile(
      path: path,
    );

    final Uint8List bytes = await file.readAsBytes();
    final img.Image? image = img.decodeImage(bytes);


    return image!;
  }
}
