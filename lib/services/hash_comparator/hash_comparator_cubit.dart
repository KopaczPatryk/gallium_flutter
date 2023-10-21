import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gallium_flutter/models/matrix2.dart';
import 'package:gallium_flutter/models/source_image.dart';
import 'package:gallium_flutter/repositories/hashes_repository.dart';
import 'package:gallium_flutter/repositories/photos_repository.dart';
import 'package:image_hasher/models/hash_model.dart';
import 'package:image_hasher/utils/hash_comparison_utils.dart';

part 'hash_comparator_cubit.freezed.dart';
part 'hash_comparator_state.dart';

class HashAssociation {
  final SourceImage sourceImage;
  final HashModel hashModel;

  const HashAssociation({
    required this.sourceImage,
    required this.hashModel,
  });

  @override
  String toString() {
    return '${sourceImage.filename} ${hashModel.toString()}';
  }
}

class HashComparatorCubit extends Cubit<HashComparatorState> {
  final PhotosRepository _photosRepository;
  final HashesRepository _hashesRepository;

  HashComparatorCubit({
    required PhotosRepository photosRepository,
    required HashesRepository hashesRepository,
  })  : _photosRepository = photosRepository,
        _hashesRepository = hashesRepository,
        super(
          const HashComparatorState.initial(),
        );

  Future<void> compareHashes() async {
    emit(
      const HashComparatorState.beganComparison(),
    );
    List<SourceImage> sourceImages = await _photosRepository.getSourceFiles();

    final List<HashAssociation> associations = [];

    for (SourceImage sourceImage in sourceImages) {
      final hash = await _hashesRepository.getHash(sourceImage);
      associations.add(
        HashAssociation(
          sourceImage: sourceImage,
          hashModel: hash,
        ),
      );
    }

    final size = associations.length;

    final comparisonMatrix = Matrix2<double?, HashAssociation, HashAssociation>(
      seriesX: associations,
      seriesY: associations,
      defaultValue: 0,
    );
    emit(
      HashComparatorState.comparisonProgress(
        comparisonMatrix: comparisonMatrix,
      ),
    );

    for (var y = 0; y < size; y++) {
      for (var x = 0; x < size; x++) {
        if (y > x) {
          var seriesForPoint = comparisonMatrix.getSeriesForPoint(Point(x, y));
          final seriesX = seriesForPoint.item1;
          final seriesY = seriesForPoint.item2;

          final double similarity = HashComparisonUtils.compareHashes(
            seriesX.hashModel,
            seriesY.hashModel,
          );

          comparisonMatrix[Point(x, y)] = similarity;
        }
      }
    }

    emit(
      HashComparatorState.comparisonDone(
        comparisonMatrix: comparisonMatrix,
      ),
    );
  }
}
