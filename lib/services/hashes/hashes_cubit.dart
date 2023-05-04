import 'dart:async';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:gallium_flutter/cfg/configuration.dart';
import 'package:gallium_flutter/repositories/hashes_repository.dart';
import 'package:gallium_flutter/repositories/photos_repository.dart';
import 'package:image/image.dart' as img;
import 'package:image_hasher/image_hasher.dart';
import 'package:image_hasher/models/hash.dart';

import 'hashes_state.dart';

class HashesCubit extends Cubit<HashesState> {
  final Configuration _cfg;
  final HashesRepository _hashRepo;
  final PhotosRepository _photosRepository;

  HashesCubit({
    required Configuration configuration,
    required PhotosRepository photosRepo,
    required HashesRepository hashRepo,
  })  : _cfg = configuration,
        _hashRepo = hashRepo,
        _photosRepository = photosRepo,
        super(HashesInitial());

  Future<void> init() async {
    emit(HashesStarting());

    final photos = await _photosRepository.getExistingPhotos();

    List<Hash> hashes = [];
    const hasher = ImageHasher();

    for (var photo in photos) {
      final Uint8List bytes = await photo.file.readAsBytes();
      final img.Image? image = img.decodeImage(bytes);
      final Hash hash = await hasher.getImageHash(image!);

      hashes.add(hash);
    }

    emit(
      FinishedState(
        hashes: hashes,
      ),
    );
  }
}
