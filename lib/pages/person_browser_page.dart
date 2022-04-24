import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:gallium_flutter/models/person.dart';
import 'package:gallium_flutter/widgets/bottom_nav_bar.dart';
import 'package:gallium_flutter/widgets/person_view.dart';

class PersonBrowserPage extends StatelessWidget {
  const PersonBrowserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Person browser'),
      ),
      body: ListView.separated(
        controller: ScrollController(),
        padding: const EdgeInsets.all(8),
        itemCount: 5,
        separatorBuilder: (_, __) => Container(height: 8),
        itemBuilder: (context, index) => PersonView(
          person: Person.johnDoe(),
          onClick: () => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Navigate to profile page"),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        router: context.tabsRouter,
      ),
    );
  }
}
