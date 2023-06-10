import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallium_flutter/app.dart';
import 'package:gallium_flutter/cfg/configuration.dart';
import 'package:gallium_flutter/navigation/app_router.gr.dart';
import 'package:gallium_flutter/repositories/preferences_repository/preference_manager.dart';
import 'package:gallium_flutter/repositories/session_repository.dart';

@RoutePage()
class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({
    super.key,
  });

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    final sessionCubit = BlocProvider.of<SessionCubit>(
      context,
    );
    sessionCubit.init(_init);
    super.initState();
  }

  Future<void> _init() async {
    final sessionRepository = RepositoryProvider.of<SessionRepository>(context);
    final preferenceManager = context.read<PreferenceManager>();
    final configuration = context.read<Configuration>();

    await preferenceManager.init();
    if (configuration.forceClearPreferences) {
      await preferenceManager.clear();
    }
    sessionRepository.init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SessionCubit, SessionState>(
      listener: (context, state) {
        if (state is Initialized) {
          AutoRouter.of(
            context,
          ).replaceAll(
            [
              const WorkspaceSetupRoute(),
            ],
          );
        } else if (state is WorkspaceInitial) {
          AutoRouter.of(
            context,
          ).replaceAll(
            const [
              DashboardRoute(),
            ],
          );
        }
      },
      child: const Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Gallium',
                style: TextStyle(fontSize: 50),
              ),
              FlutterLogo(
                size: 150,
              ),
              SizedBox(
                height: 32,
              ),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
