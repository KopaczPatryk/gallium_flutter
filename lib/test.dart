import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallium_flutter/cfg/configuration.dart';
import 'package:image/image.dart';
import 'package:provider/provider.dart';

class Test extends StatelessWidget {
  Test({Key? key}) : super(key: key) {
    final currentDir = Directory(r'E:/Zdjecia');

    final files = currentDir.listSync();
    final firstImg = files.first;

    final img = FileImage(File(firstImg.path));
    final pixels = img.file.readAsBytesSync();
    final image = decodeJpg(pixels);
    final pixel = image!.getPixel(0, 0);
  }

  @override
  Widget build(BuildContext context) {
    final cfg = context.read<Configuration>();

    return Text(cfg.basePath);
  }
}
