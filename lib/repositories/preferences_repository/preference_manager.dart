import 'package:gallium_flutter/repositories/preferences_repository/preferences/preference.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'preferences/string_preference.dart';

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
