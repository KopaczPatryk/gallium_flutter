import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('Avatar not implemented');
  }
}

class AvatarPlaceholder extends StatelessWidget {
  const AvatarPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const FittedBox(
        fit: BoxFit.fill,
        child: Icon(Icons.person),
      );
}
