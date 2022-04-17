import 'package:flutter/material.dart';
import 'package:gallium_flutter/cfg/configuration.dart';
import 'package:gallium_flutter/navigation/app_router.gr.dart';

import 'package:provider/provider.dart';

class App extends StatelessWidget {
  final Configuration _configuration;
  final AppRouter _router;

  App({
    required Configuration configuration,
    Key? key,
  })  : _configuration = configuration,
        _router = AppRouter(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Gallium flutter',
      routeInformationParser: _router.defaultRouteParser(),
      routerDelegate: _router.delegate(),
      theme: ThemeData.light(),
      builder: (context, router) => MultiProvider(
        providers: [
          Provider.value(value: _configuration),
        ],
        child: router,
      ),
    );
  }
}
