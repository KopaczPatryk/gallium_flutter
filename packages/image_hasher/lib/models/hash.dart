import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:image_hasher/models/hashlet.dart';

part 'hash.g.dart';

@HiveType(typeId: 0)
class Hash extends HiveObject with EquatableMixin {
  @HiveField(0)
  final int hashDepth;
  @HiveField(1)
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
