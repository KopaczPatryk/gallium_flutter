import 'package:flutter_test/flutter_test.dart';
import 'package:image_hasher/models/hash_cell.dart';

void main() {
  test('hashlet correctly recognizes identical objects', () {
    const a = HashCell(r: 1, g: 2, b: 3, a: 4);
    const b = HashCell(r: 1, g: 2, b: 3, a: 4);

    expect(a, equals(b));
  });
  test('hashlet correctly recognizes non identical objects', () {
    const a = HashCell(r: 1, g: 2, b: 3, a: 4);
    const b = HashCell(r: 1, g: 2, b: 2, a: 4);

    expect(a, isNot(equals(b)));
  });
}
