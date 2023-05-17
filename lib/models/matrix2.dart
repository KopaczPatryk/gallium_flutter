import 'dart:collection';
import 'dart:math';

class Matrix2<T> extends IterableBase {
  final List<T> _source;
  final int width;
  final int height;

  Matrix2._({
    required this.width,
    required this.height,
    required List<T> source,
  }) : _source = List.from(source);

  factory Matrix2.empty({
    required int width,
    required int height,
    required T defaultValue,
  }) {
    return Matrix2<T>._(
      width: width,
      height: height,
      source: List.generate(
        width * height,
        (index) => defaultValue,
      ),
    );
  }

  factory Matrix2.fromList({
    required List<T> sourceList,
    required int width,
    required int height,
  }) {
    return Matrix2._(
      width: width,
      height: height,
      source: List<T>.from(
        sourceList,
      ),
    );
  }

  int get normalizedLength => width * height;

  void operator []=(Point<int> point, T value) {
    final int index = point.y * width + point.x;
    _source[index] = value;
  }

  T operator [](Point<int> point) {
    final int index = point.y * width + point.x;
    return _source[index];
  }

  T get(int index) {
    return _source[index];
  }

  @override
  Iterator get iterator => Matrix2Iterator(this);
}

class Matrix2Iterator<T> implements Iterator<T> {
  final int _currentIndex = 0;
  final Matrix2<T> source;

  Matrix2Iterator(this.source);

  @override
  T get current {
    final Point<int> point = _indexToPoint(_currentIndex);
    return source[point];
  }

  @override
  bool moveNext() {
    final int nextIndex = _currentIndex + 1;
    if (source.length >= nextIndex) {
      return true;
    }
    return false;
  }

  Point<int> _indexToPoint(int index) {
    return Point(
      _currentIndex % source.width,
      _currentIndex ~/ source.width,
    );
  }
}
