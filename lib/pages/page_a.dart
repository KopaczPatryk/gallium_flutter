import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gallium_flutter/widgets/bottom_nav_bar.dart';

class PageA extends StatelessWidget {
  const PageA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tab A'),
      ),
      bottomNavigationBar: BottomNavBar(
        router: context.tabsRouter,
      ),
    );
  }
}
