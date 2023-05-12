import 'package:shared_preferences/shared_preferences.dart';

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

class PreferenceManager {
  static const StringPreference workspacePath = StringPreference(
    key: 'workspace',
  );

  late final SharedPreferences _preferences;
  final String _prefix;

  PreferenceManager({
    required String prefix,
  }) : _prefix = prefix;

  Future<void> init() async {
    SharedPreferences.setPrefix(_prefix);
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> clear() async {
    await _preferences.clear();
  }
}
