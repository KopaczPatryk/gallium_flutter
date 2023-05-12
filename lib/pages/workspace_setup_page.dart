import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallium_flutter/app.dart';
import 'package:gallium_flutter/navigation/app_router.gr.dart';
import 'package:gallium_flutter/repositories/session_repository.dart';

class WorkspaceSetupCubit extends Cubit<_State> {
  final SessionRepository _sessionRepository;
  String? _path;

  WorkspaceSetupCubit({
    required SessionRepository sessionRepository,
  })  : _sessionRepository = sessionRepository,
        super(_State.initial);

  Future<void> pickFolder() async {
    final path = await FilePicker.platform.getDirectoryPath();

    if (path != null && path.isNotEmpty) {
      final exists = Directory(path).existsSync();
      if (exists) {
        _path = path;
        return emit(_State.valid);
      }
    }
    return emit(_State.invalid);
  }

  Future<void> proceed() async {
    if (state == _State.valid) {
      final path = _path;
      if (path == null) {
        throw StateError('Path cannot be null');
      } else {
        await _sessionRepository.saveWorkspace(path);
      }
    }
  }
}

enum _State {
  initial,
  valid,
  invalid,
}

@RoutePage()
class WorkspaceSetupPage extends StatelessWidget {
  const WorkspaceSetupPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkspaceSetupCubit(
        sessionRepository: context.read<SessionRepository>(),
      ),
      child: BlocListener<SessionCubit, SessionState>(
        listener: (context, state) {
          if (state is WorkspaceInitial) {
            AutoRouter.of(
              context,
            ).replaceAll(
              const [
                DashboardRoute(),
              ],
            );
          }
        },
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'In order to use the app you need to specify the workspace',
                ),
                BlocBuilder<WorkspaceSetupCubit, _State>(
                  builder: (context, state) {
                    final WorkspaceSetupCubit cubit =
                        context.read<WorkspaceSetupCubit>();
                    switch (state) {
                      case _State.initial:
                        return TextButton(
                          onPressed: cubit.pickFolder,
                          child: const Text(
                            'Select folder',
                          ),
                        );
                      case _State.valid:
                        return Column(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.check,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                                TextButton(
                                  onPressed: cubit.pickFolder,
                                  child: const Text(
                                    'Select folder again',
                                  ),
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: cubit.proceed,
                              child: const Text(
                                'Proceed',
                              ),
                            ),
                          ],
                        );
                      case _State.invalid:
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.error,
                              color: Theme.of(context).colorScheme.error,
                            ),
                            TextButton(
                              onPressed: cubit.pickFolder,
                              child: const Text(
                                'Select folder again',
                              ),
                            )
                          ],
                        );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
