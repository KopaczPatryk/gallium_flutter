import 'package:equatable/equatable.dart';

class Hashlet extends Equatable {
  final int r, g, b, a;

  @override
  List<Object> get props => [r, g, b, a];

  const Hashlet({
    required this.r,
    required this.g,
    required this.b,
    required this.a,
  });
}
