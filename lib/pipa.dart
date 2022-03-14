import 'dart:io';

import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  Test({Key? key}) : super(key: key) {
    final currentDir = Directory('D:/');

    final files = currentDir.listSync();
    files.forEach((e) => print(e.path));
  }

  @override
  Widget build(BuildContext context) => Text('ddd');
}
