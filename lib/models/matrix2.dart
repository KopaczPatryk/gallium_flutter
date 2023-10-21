import 'dart:collection';
import 'dart:math';

import 'package:tuple/tuple.dart';

class Matrix2<T, X, Y> extends IterableBase<T> {
  final List<T?> _source;
  final List<X> seriesX;
  final List<Y> seriesY;

  int get width => seriesX.length;
  int get height => seriesY.length;
  int get normalizedLength => width * height;

  Matrix2({
    required this.seriesX,
    required this.seriesY,
    T? defaultValue,
  }) : _source = List<T?>.filled(
          seriesX.length * seriesY.length,
          defaultValue,
          growable: false,
        );

  int _toIndex(Point<int> point) => point.y * width + point.x;
  Point<int> _toPoint(int index) => Point(index % width, index ~/ width);

  void operator []=(Point<int> point, T value) {
    if (point.x > width || point.y > height) {
      throw RangeError('Outside of bounds ${point.toString()}');
    }

    final index = _toIndex(point);
    _source[index] = value;
  }

  T? operator [](Point<int> point) {
    final index = _toIndex(point);
    return _source[index];
  }

  T? get(int index) {
    return _source[index];
  }

  Tuple2<X, Y> getSeriesForIndex(int index) {
    final point = _toPoint(index);

    return Tuple2(
      seriesX[point.x],
      seriesY[point.y],
    );
  }

  Tuple2<X, Y> getSeriesForPoint(Point<int> point) {
    final int x = point.x;
    final int y = point.y;

    return Tuple2(
      seriesX[x],
      seriesY[y],
    );
  }

  @override
  Iterator<T> get iterator => Matrix2Iterator(this);
}

class Matrix2Iterator<T> implements Iterator<T> {
  final int _currentIndex = 0;
  final Matrix2 _source;

  Matrix2Iterator(
    this._source,
  );

  @override
  T get current {
    return _source.get(_currentIndex);
  }

  @override
  bool moveNext() {
    final int nextIndex = _currentIndex + 1;
    if (_source.normalizedLength >= nextIndex) {
      return true;
    }
    return false;
  }
}
