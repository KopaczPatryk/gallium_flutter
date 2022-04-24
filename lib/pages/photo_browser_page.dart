import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallium_flutter/services/thumbnails/thumbnails_service.dart';
import 'package:gallium_flutter/services/thumbnails/thumbnails_service_states.dart';
import 'package:gallium_flutter/widgets/bottom_nav_bar.dart';

class ImageThumbnail extends StatelessWidget {
  final VoidCallback? onClick;
  final Uint8List bytes;

  const ImageThumbnail({
    required this.bytes,
    this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onClick,
        child: Image.memory(bytes),
      );
}

class PhotoBrowserPage extends StatelessWidget {
  const PhotoBrowserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo browser'),
      ),
      body: BlocBuilder<ThumbnailsBloc, ThumbnailsState>(
        builder: (context, state) {
          if (state is GeneratingThumbnailsState) {
            return GridView.builder(
              controller: ScrollController(),
              itemCount: state.allThumbnails.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 8,
              ),
              itemBuilder: (ctx, index) => ImageThumbnail(
                onClick: () {},
                bytes: state.allThumbnails[index].imageBytes,
              ),
            );
          } else {
            return const Text('No images to show lol');
          }
        },
      ),
      bottomNavigationBar: BottomNavBar(
        router: context.tabsRouter,
      ),
    );
  }
}
