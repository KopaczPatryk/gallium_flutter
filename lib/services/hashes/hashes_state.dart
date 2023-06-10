import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_hasher/models/hash_model.dart';

part 'hashes_state.freezed.dart';

@freezed
class HashesState with _$HashesState {
  const factory HashesState.initial() = _Initial;
  const factory HashesState.beganGenerating() = _BeganGenerating;
  const factory HashesState.generating({
    required HashModel lastGenerated,
    required List<HashModel> generatedHashes,
    required int totalCount,
  }) = _Generating;
  const factory HashesState.generated({
    required HashModel lastGenerated,
    required List<HashModel> allHashes,
  }) = _Generated;
  const factory HashesState.error() = _Error;
}
