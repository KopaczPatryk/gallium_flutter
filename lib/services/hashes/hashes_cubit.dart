import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gallium_flutter/cfg/configuration.dart';
import 'package:gallium_flutter/models/source_image.dart';
import 'package:gallium_flutter/repositories/hashes_repository.dart';
import 'package:gallium_flutter/repositories/photos_repository.dart';
import 'package:image_hasher/models/hash_model.dart';

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
    emit(const HashesState.beganGenerating());

    final sourceImages = await _photosRepository.getSourceFiles();

    final List<HashModel> hashes = [];

    late HashModel lastHash;
    for (SourceImage sourceImage in sourceImages) {
      lastHash = await _hashRepo.getHash(sourceImage);

      hashes.add(lastHash);

      final newState = HashesState.generating(
        lastGenerated: lastHash,
        generatedHashes: hashes,
        totalCount: sourceImages.length,
      );

      emit(newState);
    }

    final finalState = HashesState.generated(
      lastGenerated: lastHash,
      allHashes: hashes,
    );

    emit(finalState);
  }
}
