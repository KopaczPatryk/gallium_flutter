import 'package:flutter/foundation.dart';
import 'package:gallium_flutter/repositories/preferences_repository/preferences_repository.dart';

mixin PreferencesMixin {
  @protected
  abstract PreferenceManager preferencesRepository;

  @protected
  String? get workspacePath => PreferenceManager.workspacePath.get(
        preferencesRepository,
      );
}
