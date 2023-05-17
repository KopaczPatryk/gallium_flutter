part of '../preference_manager.dart';

class StringPreference extends Preference<String?> {
  const StringPreference({
    required super.key,
  });

  @override
  String? get(PreferenceManager preferencesRepository) {
    final string = preferencesRepository._preferences.getString(key);
    return string;
  }

  @override
  Future<void> set({
    required PreferenceManager preferencesRepository,
    required covariant String value,
  }) async {
    final preferences = preferencesRepository._preferences;
    await preferences.setString(key, value);
  }
}
