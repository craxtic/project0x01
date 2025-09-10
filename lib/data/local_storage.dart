import 'package:shared_preferences/shared_preferences.dart';

// will switch to Hive anyway, no need to refactor

class LocalStorage {
  final SharedPreferences _preferences;

  LocalStorage(this._preferences);

  /* read from local storage */
  bool getBool(String key) {
    return _preferences.getBool(key) ?? false;
  }

  int getInt(String key) {
    return _preferences.getInt(key) ?? -1;
  }

  double getDouble(String key) {
    return _preferences.getDouble(key) ?? -1;
  }

  String getString(String key) {
    return _preferences.getString(key) ?? "";
  }

  List<String> getStrigList(String key) {
    return _preferences.getStringList(key) ?? [];
  }

  /* write to local storage */

  Future<void> setBool(String key, bool value) async {
    await _preferences.setBool(key, value);
  }

  Future<void> setInt(String key, int value) async {
    await _preferences.setInt(key, value);
  }

  Future<void> setDouble(String key, double value) async {
    await _preferences.setDouble(key, value);
  }

  Future<void> setString(String key, String value) async {
    await _preferences.setString(key, value);
  }

  Future<void> setStringList(String key, List<String> value) async {
    await _preferences.setStringList(key, value);
  }
}
