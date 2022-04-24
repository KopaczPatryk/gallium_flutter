import 'package:flutter/material.dart';

class AvatarPlaceholder extends StatelessWidget {
  const AvatarPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const FittedBox(
        fit: BoxFit.fill,
        child: Icon(Icons.person),
      );
}
