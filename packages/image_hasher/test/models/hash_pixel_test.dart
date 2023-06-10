import 'package:flutter_test/flutter_test.dart';
import 'package:image_hasher/models/hash_pixel.dart';

void main() {
  test('$HashPixel correctly recognizes identical objects', () {
    const a = HashPixel(r: 1, g: 2, b: 3, a: 4);
    const b = HashPixel(r: 1, g: 2, b: 3, a: 4);

    expect(a, equals(b));
  });
  test('$HashPixel correctly recognizes non identical objects', () {
    const a = HashPixel(r: 1, g: 2, b: 3, a: 4);
    const b = HashPixel(r: 1, g: 2, b: 2, a: 4);

    expect(a, isNot(equals(b)));
  });
}
