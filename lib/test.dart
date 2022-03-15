import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:gallium_flutter/cfg/configuration.dart';
import 'package:image/image.dart';
import 'package:provider/provider.dart';

int abgrToArgb(int abgrColor) {
  int r = (abgrColor >> 16) & 0xFF;
  int b = abgrColor & 0xFF;
  return (abgrColor & 0xFF00FF00) | (b << 16) | r;
}

class Test extends StatelessWidget {
  late List<ui.Color> c = [];
  Test({Key? key}) : super(key: key) {
    final currentDir = Directory(r'C:\Users\Kopac\Desktop');

    final files = currentDir.listSync();
    final firstImg =
        files.where((element) => element.path.contains('test img.jpg')).first;

    final img = FileImage(File(firstImg.path));
    final pixels = img.file.readAsBytesSync();
    final dd = decodeImage(pixels);

    final image = decodeJpg(pixels);

    for (var i = 0; i < 3; i++) {
      final pixel = image!.getPixel(0, i);
      c.add(ui.Color(abgrToArgb(pixel)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final cfg = context.read<Configuration>();

    return Column(
      children: [
        for (var item in c)
          Container(
            width: 3,
            height: 3,
            color: item,
          )
      ],
    );
  }
}
