import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallium_flutter/app.dart';
import 'package:gallium_flutter/navigation/app_router.gr.dart';
import 'package:gallium_flutter/pages/workspace_setup_page/workspace_setup_cubit.dart';
import 'package:gallium_flutter/repositories/session_repository.dart';

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
                BlocBuilder<WorkspaceSetupCubit, WorkspaceSetupState>(
                  builder: (context, state) {
                    final WorkspaceSetupCubit cubit =
                        context.read<WorkspaceSetupCubit>();
                    switch (state) {
                      case WorkspaceSetupState.initial:
                        return TextButton(
                          onPressed: cubit.pickFolder,
                          child: const Text(
                            'Select folder',
                          ),
                        );
                      case WorkspaceSetupState.valid:
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
                      case WorkspaceSetupState.invalid:
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
