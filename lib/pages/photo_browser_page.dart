import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallium_flutter/models/thumbnail_image.dart';
import 'package:gallium_flutter/services/thumbnails/thumbnails_cubit.dart';
import 'package:gallium_flutter/services/thumbnails/thumbnails_state.dart';
import 'package:gallium_flutter/widgets/bottom_nav_bar.dart';

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

@RoutePage()
class PhotoBrowserPage extends StatelessWidget {
  const PhotoBrowserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo browser'),
      ),
      body: BlocBuilder<ThumbnailsCubit, ThumbnailsState>(
        builder: (context, state) {
          if (state is GeneratingThumbnailsState) {
            return GridView.builder(
              controller: ScrollController(),
              itemCount: state.allThumbnails.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
              ),
              itemBuilder: (ctx, index) => ImageThumbnail(
                onClick: () {},
                thumbnail: state.allThumbnails[index],
              ),
            );
          } else {
            return const Text('No images to show lol');
          }
        },
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
