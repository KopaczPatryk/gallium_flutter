import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallium_flutter/services/hashes/hashes_cubit.dart';
import 'package:gallium_flutter/services/hashes/hashes_state.dart';
import 'package:gallium_flutter/widgets/bottom_nav_bar.dart';

@RoutePage()
class PhotoBrowserPage extends StatefulWidget {
  const PhotoBrowserPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PhotoBrowserPageState();
}

class _PhotoBrowserPageState extends State<PhotoBrowserPage> {
  @override
  void initState() {
    BlocProvider.of<HashesCubit>(context).init();
    super.initState();
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
              beganGenerating: () => const Text('Generating hashes'),
              generating: (lastGenerated, generatedHashes, totalCount) => Text(
                'Generated ${generatedHashes.length} of $totalCount hashes...',
              ),
              generated: (lastGenerated, allHashes) => Text(
                'Done generating ${allHashes.length} hashes',
              ),
              error: () => const Text('Error'),
            );
          },
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
