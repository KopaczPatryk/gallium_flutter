import 'dart:io';
import 'dart:typed_data';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart' as p;

class Thumbnail with EquatableMixin {
  final File file;
  Uint8List? _imageBytes;

  String get filename => p.basename(file.path);

  @override
  List<Object?> get props => [
        file.path,
      ];

  Thumbnail({
    required this.file,
    Uint8List? imageBytes,
  }) : _imageBytes = imageBytes;

  Uint8List imageBytes() {
    final tempFile = FileImage(
      File(file.path),
    );
    final bytes = tempFile.file.readAsBytesSync();

    _imageBytes ??= bytes;
    return _imageBytes!;
  }
}
