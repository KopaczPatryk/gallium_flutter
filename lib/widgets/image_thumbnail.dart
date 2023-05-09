import 'package:flutter/material.dart';
import 'package:gallium_flutter/models/thumbnail_image.dart';

class ImageThumbnail extends StatelessWidget {
  final VoidCallback? onClick;
  final ThumbnailImage thumbnail;

  const ImageThumbnail({
    required this.thumbnail,
    this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onClick,
        child: Image.file(
          thumbnail.fileImage.file,
          isAntiAlias: true,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.medium,
        ),
      );
}
