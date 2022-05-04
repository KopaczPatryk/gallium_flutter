import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gallium_flutter/cfg/configuration.dart';
import 'package:gallium_flutter/repositories/hashes_repository.dart';
import 'package:gallium_flutter/repositories/photos_repository.dart';
import 'package:image_hasher/image_hasher.dart';
import 'package:image_hasher/models/hash.dart';

import 'hashes_bloc_events.dart';
import 'hashes_bloc_states.dart';
import 'package:image/image.dart' as img;

class HashesBloc extends Bloc<HashesEvent, HashesState> {
  final Configuration _cfg;
  final HashesRepository _hashRepo;
  final PhotosRepository _photosRepository;

  HashesBloc({
    required Configuration configuration,
    required PhotosRepository photosRepo,
    required HashesRepository hashRepo,
  })  : _cfg = configuration,
        _hashRepo = hashRepo,
        _photosRepository = photosRepo,
        super(HashesInitial()) {
    on<HashesInit>(_init);
  }

  FutureOr<void> _init(HashesInit event, Emitter<HashesState> emit) async {
    emit(HashesStarting());

    final photos = await _photosRepository.getExistingPhotos();

    List<Hash> hashes = [];
    const hasher = ImageHasher();

    for (var photo in photos) {
      final image = img.decodeImage(await photo.file.readAsBytes());
      final hash = await hasher.getImageHash(image!);
      hashes.add(hash);
    }

    emit(FinishedState(hashes: hashes));
  }
}
