import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallium_flutter/services/thumbnails/thumbnails_service.dart';
import 'package:gallium_flutter/services/thumbnails/thumbnails_service_states.dart';
import 'package:gallium_flutter/widgets/bottom_nav_bar.dart';

class PersonBrowserPage extends StatelessWidget {
  const PersonBrowserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Person browser'),
      ),
      body: Column(children: [
        Text('data'),
      ]),
      bottomNavigationBar: BottomNavBar(
        router: context.tabsRouter,
      ),
    );
  }
}
