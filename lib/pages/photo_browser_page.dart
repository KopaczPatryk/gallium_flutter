// ignore_for_file: prefer_const_constructors

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallium_flutter/services/thumbnails_service.dart';
import 'package:gallium_flutter/services/thumbnails_service_states.dart';
import 'package:gallium_flutter/widgets/bottom_nav_bar.dart';

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
            // return List.generate(10, (index) => ImageThumbnail();
            return GridView.builder(
              itemCount: state.allThumbnails.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 8,
              ),
              itemBuilder: (ctx, index) => Container(),
            );
          } else {
            return Text('No images to show lol');
          }
        },
      ),
      bottomNavigationBar: BottomNavBar(
        router: context.tabsRouter,
      ),
    );
  }
}

class ImageThumbnail extends StatelessWidget {
  const ImageThumbnail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}
