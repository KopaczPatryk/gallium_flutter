import 'package:equatable/equatable.dart';

class Hashlet with EquatableMixin {
  final int r;
  final int g;
  final int b;
  final int a;

  @override
  List<int> get props => [r, g, b, a];

  const Hashlet({
    required this.r,
    required this.g,
    required this.b,
    required this.a,
  });
}
