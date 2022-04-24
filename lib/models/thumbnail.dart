import 'dart:io';
import 'dart:typed_data';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart' as p;

class Thumbnail with EquatableMixin {
  final File file;
  Uint8List? _imageBytes;

  get filename => p.basenameWithoutExtension(file.path);

  Uint8List get imageBytes {
    final tempFile = FileImage(File(file.path));
    final bytes = tempFile.file.readAsBytesSync();

    _imageBytes ??= bytes;
    return _imageBytes!;
  }

  @override
  List<Object?> get props => [file.path];

  Thumbnail({
    required this.file,
    Uint8List? imageBytes,
  }) : _imageBytes = imageBytes;
}
