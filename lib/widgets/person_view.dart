import 'package:flutter/material.dart';

import 'package:gallium_flutter/models/person.dart';
import 'package:gallium_flutter/widgets/avatar_placeholder.dart';

class PersonView extends StatelessWidget {
  final Person person;

  const PersonView({
    required this.person,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.blueGrey[50],
          ),
          child: const SizedBox(
            width: 250,
            height: 250,
            child: AvatarPlaceholder(),
          ),
        ),
        const SizedBox(width: 8),
        Column(
          children: [
            Text(
              person.name,
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              person.lastName,
              style: const TextStyle(fontSize: 24),
            ),
          ],
        )
      ],
    );
  }
}
