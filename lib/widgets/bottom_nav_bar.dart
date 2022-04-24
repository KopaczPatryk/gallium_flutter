import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final TabsRouter router;

  const BottomNavBar({
    required this.router,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: router.activeIndex,
      onTap: router.setActiveIndex,
      items: const [
        BottomNavigationBarItem(label: 'Photos', icon: Icon(Icons.photo)),
        BottomNavigationBarItem(label: 'People', icon: Icon(Icons.person)),
        BottomNavigationBarItem(label: 'Faces', icon: Icon(Icons.face)),
      ],
    );
  }
}
