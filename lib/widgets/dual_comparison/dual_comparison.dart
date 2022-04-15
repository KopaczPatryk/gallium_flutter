import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:image_hasher/image_hasher.dart';
import 'package:image_hasher/utils/hash_comparator.dart';

class DualComparison extends StatefulWidget {
  final String fileA, fileB;

  const DualComparison({
    required this.fileA,
    required this.fileB,
    Key? key,
  }) : super(key: key);

  @override
  State<DualComparison> createState() => _DualComparisonState();
}

class _DualComparisonState extends State<DualComparison> {
  late List<Uint8List> imagesBytes;
  late double similarity;

  @override
  void initState() {
    imagesBytes = [widget.fileA, widget.fileB].map((path) {
      final fileImage = FileImage(
        File(path),
      );

      final pixels = fileImage.file.readAsBytesSync();
      return pixels;
    }).toList();

    final hashes = imagesBytes.map((image) {
      final resultImage = img.decodeImage(image);
      const hasher = ImageHasher();

      if (resultImage == null) {
        throw Exception('No codec for image');
      } else {
        return hasher.getImageHash(resultImage);
      }
    }).toList();

    similarity = HashComparator.compareHashes(hashes.first, hashes.last);

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Similarity: $similarity'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imagesBytes
                .map(
                  (image) => Image.memory(
                    image,
                    isAntiAlias: false,
                    fit: BoxFit.fill,
                    width: 500,
                  ),
                )
                .toList(),
          ),
        ],
      );
}
