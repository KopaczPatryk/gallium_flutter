import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gallium_flutter/cfg/configuration.dart';
import 'package:gallium_flutter/models/source_image.dart';
import 'package:gallium_flutter/repositories/hashes_repository.dart';
import 'package:gallium_flutter/repositories/photos_repository.dart';
import 'package:image_hasher/models/hash.dart';

import 'hashes_state.dart';

class HashesCubit extends Cubit<HashesState> {
  final HashesRepository _hashRepo;
  final PhotosRepository _photosRepository;

  HashesCubit({
    required Configuration configuration,
    required PhotosRepository photosRepo,
    required HashesRepository hashRepo,
  })  : _hashRepo = hashRepo,
        _photosRepository = photosRepo,
        super(const HashesState.initial());

  Future<void> init() async {
    emit(const HashesState.generating());

    final photos = await _photosRepository.getSourceFiles();

    final List<Hash> hashes = [];

    for (SourceImage sourceImage in photos) {
      final Hash hash = await _hashRepo.getHash(sourceImage);

      hashes.add(hash);
      emit(
        HashesState.generated(
          lastGenerated: hash,
          allHashes: hashes,
          totalCount: photos.length,
        ),
      );
    }
  }
}
