import 'package:equatable/equatable.dart';
import 'package:image_hasher/models/hashlet.dart';

class Hash extends Equatable {
  final int hashDepth;
  final List<Hashlet> _hash;

  int get length => _hash.length;

  @override
  List<Object> get props => [hashDepth, _hash];

  Hash({
    required this.hashDepth,
  }) : _hash = [];

  void add(Hashlet element) => _hash.add(element);

  Hashlet operator [](int index) => _hash[index];
}
