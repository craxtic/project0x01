import 'package:flutter/material.dart';
import 'package:project0x01/core/dictionary.dart';

enum FontSize { small, medium, large }

enum Topics {
  none,
  algebra,
  geometry,
  inequality,
  numberTheory,
} // TODO: add more

abstract final class DefaultSettings {
  static const ThemeMode themeMode = ThemeMode.system;
  static const Language language = Language.khmer;
  static const FontSize fontSize = FontSize.medium;
  static const List<Topics> favoriteTopicList = [Topics.none];
}
