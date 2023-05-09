import 'package:image_hasher/models/hash.dart';

abstract class HashesState {
  const HashesState();
}

class HashesInitial extends HashesState {}

class HashesGenerating extends HashesState {
  const HashesGenerating();
}

class HashGenerated extends HashesGenerating {
  final Hash lastGenerated;
  final List<Hash> allHashes;

  const HashGenerated({
    required this.lastGenerated,
    required this.allHashes,
  });
}
