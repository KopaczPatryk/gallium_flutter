import 'package:flutter/material.dart';

import 'package:gallium_flutter/models/person.dart';
import 'package:gallium_flutter/widgets/avatar_placeholder.dart';

class PersonView extends StatelessWidget {
  final Person person;

  final VoidCallback? onClick;

  const PersonView({
    required this.person,
    this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 48, 158, 231).withAlpha(50),
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
      ),
    );
  }
}
