import 'dart:collection';

// import 'package:equatable/equatable.dart';
import 'package:image_hasher/models/hashlet.dart';

class Hash extends ListBase<Hashlet>
// with EquatableMixin
{
  final int hashDepth;
  final List<Hashlet> _hash;

  // @override
  // List<Object?> get props => [hashDepth, _hash];

  Hash({
    required this.hashDepth,
  }) : _hash = [];

  @override
  set length(int newLength) {
    _hash.length = newLength;
  }

  @override
  int get length => _hash.length;

  @override
  Hashlet operator [](int index) => _hash[index];

  @override
  void operator []=(int index, Hashlet value) => _hash[index] = value;

  @override
  void add(Hashlet element) => _hash.add(element);
}
