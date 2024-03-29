import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
// import 'package:image/image.dart' as img;
// import 'package:image_hasher/image_hasher.dart';

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
  late double similarity = 0;

  @override
  void initState() {
    imagesBytes = [
      widget.fileA,
      widget.fileB,
    ].map((String path) {
      final FileImage fileImage = FileImage(
        File(path),
      );

      final Uint8List pixels = fileImage.file.readAsBytesSync();
      return pixels;
    }).toList();

    // final hashFutures = imagesBytes.map((image) {
    //   final resultImage = img.decodeImage(image);
    //   const hasher = ImageHasher();

    //   if (resultImage == null) {
    //     throw Exception('No codec for image');
    //   } else {
    //     return hasher.getImageHash(resultImage);
    //   }
    // }).toList();

    // final List<Hash> hashes = [];
    // hashFutures.first.then(hashes.add);
    // hashFutures.last.then(hashes.add);

    // similarity =
    //     HashComparator.compareHashes(hashFutures.first, hashFutures.last);

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
