import 'package:image_hasher/models/hash.dart';

abstract class HashesState {
  const HashesState();
}

class HashesInitial extends HashesState {}

class HashesStarting extends HashesState {}

class FinishedState extends HashesState {
  final List<Hash> hashes;

  const FinishedState({
    required this.hashes,
  });
}
