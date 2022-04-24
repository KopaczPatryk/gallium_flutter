import 'package:flutter_test/flutter_test.dart';
import 'package:image_hasher/models/hash.dart';
import 'package:image_hasher/models/hashlet.dart';

void main() {
  test('hashes with same const hashlets are equal', () {
    final a = Hash(hashDepth: 8);
    final b = Hash(hashDepth: 8);
    final hashlet = Hashlet(r: 1, g: 2, b: 3, a: 4);

    a.add(hashlet);
    b.add(hashlet);

    expect(a, equals(b));
  });

  test('hashes with same hashlets are equal', () {
    final a = Hash(hashDepth: 8);
    final b = Hash(hashDepth: 8);
    final hashlet = Hashlet(r: 1, g: 2, b: 3, a: 4);
    final hashlet2 = Hashlet(r: 1, g: 2, b: 3, a: 4);

    a.add(hashlet);
    b.add(hashlet2);

    expect(a, equals(b));
  });

  test('hashes with different hashlets are not equal', () {
    final a = Hash(hashDepth: 8);
    final b = Hash(hashDepth: 8);

    final hashlet = Hashlet(r: 1, g: 2, b: 3, a: 4);
    // const hashlet2 = Hashlet(r: 1, g: 2, b: 3, a: 4);

    a.add(hashlet);
    // b.add(hashlet2);

    expect(a, isNot(equals(b)));
  });

  test('hashes with different depths are not equal', () {
    final a = Hash(hashDepth: 8);
    final b = Hash(hashDepth: 4);

    final hashlet = Hashlet(r: 1, g: 2, b: 3, a: 4);
    final hashlet2 = Hashlet(r: 1, g: 2, b: 3, a: 4);

    a.add(hashlet);
    b.add(hashlet2);

    expect(a, isNot(equals(b)));
  });
}
