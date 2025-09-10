import 'package:flutter/material.dart';
import 'package:project0x01/data/local_storage.dart';
import 'package:project0x01/core/dictionary.dart';
import 'package:project0x01/core/configs.dart';

class Settings {
  final LocalStorage _storage;
  final VoidCallback rebuild;

  Settings(this._storage, this.rebuild) {
    if (!hasSeenWelcome()) _initializeDefaultSettings();
  }

  void _initializeDefaultSettings() {
    _storage.setInt("theme", DefaultSettings.themeMode.index);
    _storage.setInt("fontSize", DefaultSettings.fontSize.index);
    _storage.setInt("language", DefaultSettings.language.index);
    setFavoriteTopicList(DefaultSettings.favoriteTopicList);
  }

  // no user access
  bool hasSeenWelcome() {
    return _storage.getBool("seenWelcome");
  }

  Future<void> seenWelcome() async {
    _storage.setBool("seenWelcome", true);
    rebuild();
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

  // font size
  FontSize getFonSize() {
    int index = _storage.getInt("fontSize");
    return FontSize.values[index];
  }

  Future<void> setFontSize(FontSize fontSize) async {
    await _storage.setInt("fontSize", fontSize.index);
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

  // favorite topics
  List<Topics> getFavoriteTopicList() {
    List<String> stringList = _storage.getStrigList("favoriteTopicList");
    List<Topics> topicList = [];
    for (String str in stringList) {
      int index = int.parse(str);
      topicList.add(Topics.values[index]);
    }
    return topicList;
  }

  Future<void> setFavoriteTopicList(List<Topics> topicList) async {
    List<String> stringList = [];
    for (Topics topic in topicList) {
      stringList.add(topic.index.toString());
    }
    await _storage.setStringList("favoriteTopicList", stringList);
  }
}
