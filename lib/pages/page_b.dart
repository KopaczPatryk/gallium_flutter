import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gallium_flutter/widgets/bottom_nav_bar.dart';

class PageB extends StatelessWidget {
  const PageB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tab B'),
      ),
      bottomNavigationBar: BottomNavBar(
        router: context.tabsRouter,
      ),
    );
  }
}
