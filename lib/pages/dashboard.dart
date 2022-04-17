import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gallium_flutter/navigation/app_router.gr.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        PageARoute(),
        PageBRoute(),
        PageCRoute(),
      ],
      builder: (ctx, child, animation) => child,
    );
  }
}
