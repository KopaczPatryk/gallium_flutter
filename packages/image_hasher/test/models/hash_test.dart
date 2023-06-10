import 'package:flutter_test/flutter_test.dart';
import 'package:image_hasher/models/hash_model.dart';
import 'package:image_hasher/models/hash_pixel.dart';

void main() {
  test('hashes with same const hashlets are equal', () {
    final a = HashModel(resolution: 1, depth: 8);
    final b = HashModel(resolution: 1, depth: 8);
    const hashlet = HashPixel(r: 1, g: 2, b: 3, a: 4);

    a[0] = hashlet;
    b[0] = hashlet;

    expect(a, equals(b));
  });

  test('hashes with same hashlets are equal', () {
    final a = HashModel(resolution: 1, depth: 8);
    final b = HashModel(resolution: 1, depth: 8);
    const hashlet = HashPixel(r: 1, g: 2, b: 3, a: 4);
    const hashlet2 = HashPixel(r: 1, g: 2, b: 3, a: 4);

    a[0] = hashlet;
    b[0] = hashlet2;

    expect(a, equals(b));
  });

  test('hashes with different hash arrays are not equal', () {
    final a = HashModel(resolution: 1, depth: 8);
    final b = HashModel(resolution: 1, depth: 8);
    const hashlet = HashPixel(r: 1, g: 2, b: 3, a: 4);

    a[0] = hashlet;

    expect(a, isNot(equals(b)));
  });

  test('hashes with different depths are not equal', () {
    final a = HashModel(resolution: 1, depth: 8);
    final b = HashModel(resolution: 1, depth: 4);

    const hashlet = HashPixel(r: 1, g: 2, b: 3, a: 4);
    const hashlet2 = HashPixel(r: 1, g: 2, b: 3, a: 4);

    a[0] = hashlet;
    b[0] = hashlet2;

    expect(a, isNot(equals(b)));
  });
}
