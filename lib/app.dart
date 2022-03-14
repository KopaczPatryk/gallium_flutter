import 'package:flutter/material.dart';
import 'package:gallium_flutter/cfg/configuration.dart';
import 'package:gallium_flutter/pipa.dart';

class App extends StatelessWidget {
  final Configuration _configuration;

  const App({
    required Configuration configuration,
    Key? key,
  })  : _configuration = configuration,
        super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(),
        body: Test(),
      ),
    );
  }
}
