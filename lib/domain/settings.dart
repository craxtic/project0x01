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
    _storage.set(
      StorageType.settings,
      "theme",
      DefaultSettings.getSystemThemeMode().index,
    );
    _storage.set(StorageType.settings, "fontSize", DefaultSettings.fontSize);
    _storage.set(
      StorageType.settings,
      "language",
      DefaultSettings.language.index,
    );
    setFavoriteTopicList(DefaultSettings.favoriteTopicList);
  }

  // no user access
  bool hasSeenWelcome() {
    return _storage.containsKey(StorageType.settings, "seenWelcome");
  }

  Future<void> seenWelcome() async {
    _storage.set(StorageType.settings, "seenWelcome", true);
    rebuild();
  }

  // theme mode
  ThemeMode getThemeMode() {
    int index = _storage.get(StorageType.settings, "theme");
    return ThemeMode.values[index];
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    await _storage.set(StorageType.settings, "theme", mode.index);
    rebuild();
  }

  // font size
  double getFonSize() {
    return _storage.get(StorageType.settings, "fontSize");
  }

  Future<void> setFontSize(double fontSize) async {
    await _storage.set(StorageType.settings, "fontSize", fontSize);
    rebuild();
  }

  //language
  Language getLanguage() {
    int index = _storage.get(StorageType.settings, "language");
    return Language.values[index];
  }

  Future<void> setLanguage(Language language) async {
    await _storage.set(StorageType.settings, "language", language.index);
    rebuild();
  }

  // favorite topics
  List<Topics> getFavoriteTopicList() {
    List<String> stringList = _storage.get(
      StorageType.favoriteTopics,
      "favoriteTopicList",
    );
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
    await _storage.set(
      StorageType.favoriteTopics,
      "favoriteTopicList",
      stringList,
    );
  }
}
