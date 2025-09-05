import 'package:flutter/material.dart';
import 'package:project0x01/data/local_storage.dart';
import 'package:project0x01/core/dictionary.dart';

class Settings {
  final LocalStorage _storage;
  final VoidCallback rebuild;

  Settings(this._storage, this.rebuild);

  // no user access
  bool hasSeenWelcome() {
    return _storage.getBool("seenWelcome");
  }

  Future<void> seenWelcome() async {
    _storage.setBool("seenWelcome", true);
  }

  // theme mode
  ThemeMode getThemeMode() {
    int index = _storage.getInt("theme");
    return ThemeMode.values[index];
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    await _storage.setInt("theme", mode.index);
    rebuild();
  }

  //fontsize
  int getFontSize() {
    return _storage.getInt("fontSize");
  }

  Future<void> setFontSize(int size) async {
    await _storage.setInt("fontSize", size);
  }

  //language

  Language getLanguage() {
    int index = _storage.getInt("language");
    return Language.values[index];
  }

  Future<void> setLanguage(Language language) async {
    await _storage.setInt("language", language.index);
    rebuild();
  }
}
