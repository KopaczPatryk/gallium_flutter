import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'hashlet.g.dart';

@HiveType(typeId: 1)
class Hashlet extends HiveObject with EquatableMixin {
  @HiveField(0)
  final int r;

  @HiveField(1)
  final int g;

  @HiveField(2)
  final int b;

  @HiveField(3)
  final int a;

  @override
  List<Object> get props => [r, g, b, a];

  Hashlet({
    required this.r,
    required this.g,
    required this.b,
    required this.a,
  });
}
