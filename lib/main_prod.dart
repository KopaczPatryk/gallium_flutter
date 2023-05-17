import 'package:flutter/material.dart';
import 'package:gallium_flutter/app.dart';
import 'package:gallium_flutter/cfg/configuration.dart';

void main() {
  runApp(
    const App(
      configuration: Configuration.prod,
    ),
  );
}
