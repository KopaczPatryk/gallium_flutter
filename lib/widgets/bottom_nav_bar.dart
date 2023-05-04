import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: context.tabsRouter.activeIndex,
      onTap: context.tabsRouter.setActiveIndex,
      items: const [
        BottomNavigationBarItem(label: 'Photos', icon: Icon(Icons.photo)),
        BottomNavigationBarItem(label: 'People', icon: Icon(Icons.person)),
        BottomNavigationBarItem(label: 'Faces', icon: Icon(Icons.face)),
      ],
    );
  }
}
