import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallium_flutter/cfg/configuration.dart';
import 'package:gallium_flutter/navigation/app_router.dart';
import 'package:gallium_flutter/repositories/preferences_repository/preference_manager.dart';
import 'package:gallium_flutter/repositories/session_repository.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  final Configuration configuration;

  const App({
    required this.configuration,
    Key? key,
  }) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AppRouter _router;

  late final SessionRepository _sessionRepository;
  late final PreferenceManager _preferencesManager;

  late final SessionCubit _sessionCubit;

  @override
  void initState() {
    _preferencesManager = PreferenceManager(
      prefix: widget.configuration.preferencesPrefix,
    );
    _sessionRepository = SessionRepository(
      preferencesRepository: _preferencesManager,
    );
    _sessionCubit = SessionCubit(
      sessionRepository: _sessionRepository,
      configuration: widget.configuration,
    );

    _router = AppRouter(
      preferencesRepository: _preferencesManager,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scrollBehavior: MyScrollBehavior(),
      title: 'Gallium flutter',
      routeInformationParser: _router.defaultRouteParser(),
      routerDelegate: _router.delegate(),
      theme: ThemeData.dark(),
      builder: (context, router) => MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: _sessionCubit,
          ),
        ],
        child: MultiProvider(
          providers: [
            Provider.value(
              value: widget.configuration,
            ),
            RepositoryProvider.value(
              value: _sessionRepository,
            ),
            RepositoryProvider.value(
              value: _preferencesManager,
            ),
          ],
          child: router,
        ),
      ),
    );
  }
}

class MyScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class SessionCubit extends Cubit<SessionState> {
  final Configuration _configuration;
  final SessionRepository _sessionRepository;
  late final StreamSubscription? _sessionSubscription;

  SessionCubit({
    required SessionRepository sessionRepository,
    required Configuration configuration,
  })  : _sessionRepository = sessionRepository,
        _configuration = configuration,
        super(
          Initial(),
        ) {
    _sessionSubscription = _sessionRepository.workspacePathStream.listen(
      (event) {
        if (event != null && state is Initialized) {
          emit(WorkspaceInitial());
        }
      },
    );
  }

  Future<void> init(AsyncCallback asyncCallback) async {
    if (state is! Initial) return;

    emit(
      Initializing(),
    );
    await Future.wait(
      [
        asyncCallback(),
        Future.delayed(
          _configuration.splashScreenDuration,
        ),
      ],
    );

    final workspacePath = await _sessionRepository.workspacePathStream.first;

    if (workspacePath != null) {
      emit(
        WorkspaceInitial(),
      );
    } else {
      emit(
        Initialized(),
      );
    }
  }

  Future<void> initWorkspace(AsyncCallback asyncCallback) async {
    if (state is WorkspaceInitialized) return;
    if (state is! WorkspaceInitial) {
      throw StateError('Not correctly initialized');
    }

    emit(WorkspaceInitializing());
    await asyncCallback();
    emit(WorkspaceInitialized());
  }

  @override
  Future<void> close() {
    _sessionSubscription?.cancel();
    return super.close();
  }
}

abstract class SessionState {}

class Initial extends SessionState {}

class Initializing extends SessionState {}

class Initialized extends SessionState {}

class WorkspaceInitial extends SessionState {}

class WorkspaceInitializing extends SessionState {}

class WorkspaceInitialized extends SessionState {}
