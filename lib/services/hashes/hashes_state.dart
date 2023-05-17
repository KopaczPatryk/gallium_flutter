import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_hasher/models/hash.dart';

part 'hashes_state.freezed.dart';

@freezed
class HashesState with _$HashesState {
  const factory HashesState.initial() = _Initial;
  const factory HashesState.generating() = _Generating;
  const factory HashesState.generated({
    required HashModel lastGenerated,
    required List<HashModel> allHashes,
    required int totalCount,
  }) = _Generated;
  const factory HashesState.error() = _Error;
}
