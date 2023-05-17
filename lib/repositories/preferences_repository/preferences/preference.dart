import 'package:gallium_flutter/repositories/preferences_repository/preference_manager.dart';

abstract class Preference<T> {
  final String key;

  const Preference({
    required this.key,
  });

  T get(PreferenceManager preferencesRepository);
  Future<void> set({
    required PreferenceManager preferencesRepository,
    required T value,
  }) async {}
}
