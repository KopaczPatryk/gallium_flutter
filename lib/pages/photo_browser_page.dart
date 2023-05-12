import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallium_flutter/models/thumbnail_image.dart';
import 'package:gallium_flutter/services/hashes/hashes_cubit.dart';
import 'package:gallium_flutter/services/hashes/hashes_state.dart';
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
class PhotoBrowserPage extends StatefulWidget {
  const PhotoBrowserPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PhotoBrowserPageState();
}

class _PhotoBrowserPageState extends State<PhotoBrowserPage> {
  @override
  void didChangeDependencies() {
    BlocProvider.of<HashesCubit>(context).init();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo browser'),
      ),
      body: Center(
        child: BlocBuilder<HashesCubit, HashesState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Text('Idle'),
              generating: () => const Text('Generating hashes'),
              generated: (lastGenerated, allHashes, totalCount) {
                return Text(
                  'Generated ${allHashes.length} of $totalCount hashes',
                );
              },
              error: () => const Text('Error'),
            );
          },
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
