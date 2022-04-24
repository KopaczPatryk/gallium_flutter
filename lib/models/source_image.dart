import 'dart:io';
import 'package:gallium_flutter/models/thumbnail.dart';
import 'package:path/path.dart' as p;

class SourceImage implements Comparable<Thumbnail> {
  final File file;

  String get filename => p.basenameWithoutExtension(file.path);

  const SourceImage(this.file);

  @override
  int compareTo(Thumbnail other) => filename == other.filename ? 0 : -1;
}
