import 'package:flutter/material.dart';
import 'package:gallium_flutter/models/thumbnail.dart';

class ImageThumbnail extends StatelessWidget {
  final VoidCallback? onClick;
  final Thumbnail thumbnail;

  const ImageThumbnail({
    required this.thumbnail,
    this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onClick,
        child: Image.memory(
          thumbnail.imageBytes,
          isAntiAlias: true,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.medium,
        ),
      );
}