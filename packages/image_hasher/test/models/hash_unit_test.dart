import 'package:flutter_test/flutter_test.dart';
import 'package:image_hasher/models/hash_unit.dart';

void main() {
  test('$HashUnit correctly recognizes identical objects', () {
    const a = HashUnit(r: 1, g: 2, b: 3, a: 4);
    const b = HashUnit(r: 1, g: 2, b: 3, a: 4);

    expect(a, equals(b));
  });
  test('$HashUnit correctly recognizes non identical objects', () {
    const a = HashUnit(r: 1, g: 2, b: 3, a: 4);
    const b = HashUnit(r: 1, g: 2, b: 2, a: 4);

    expect(a, isNot(equals(b)));
  });
}
